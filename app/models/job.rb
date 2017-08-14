require 'openssl'
class Job < ApplicationRecord
  belongs_to :upload
  belongs_to :user

  mount_uploader :file_name, TranscriptedFilesUploader

  before_save do
    size = self.upload.file_name.file.size
    size+=self.file_name.file.size
    self.file_size=size
    if self.status==Job.statuses[:finished]
      data = draft
      fname = "tmp/uploads/job_#{id}.txt"
      file = File.open(fname, 'wb') { |file| file.write(data) }
      puts("File created #{fname}")
      file = get_business.encrypt(fname)

      File.open("tmp/uploads/job_#{id}.txt") do |f|
        self.file_name = f
      end
    end
  end

  # after_save do
  #   if self.status==Job.statuses[:finished]
  #     file = File.delete("tmp/uploads/job_#{id}.txt", 'wb')
  #   end
  # end

  def get_business
    self.user.business
  end

  def self.statuses
    {in_queue: 'In Queue', transcribing: 'Transcribing', finished: 'Finished', error: 'Error', drafting: 'Drafting'}
  end

  def get_file
    if self.status==(Job.statuses[:in_queue])
      'Your request is already in the queue'
    elsif self.status==(Job.statuses[:transcribing])
      'Your request is being processed'
    elsif self.status==(Job.statuses[:drafting])
      'Your request is being being double checked'
    elsif self.status==(Job.statuses[:finished])
      get_data
    elsif self.status==(Job.statuses[:error])
      'There is some error our techies are looking into it'
    end
  end

  def get_data
    connection = Fog::Storage.new({ :provider => "AWS", :aws_access_key_id => Rails.application.secrets.aws_access_key_id, :aws_secret_access_key => Rails.application.secrets.aws_secret_access_key, region: Rails.application.secrets.region })
    bucket = connection.directories.new(:key => Rails.application.secrets.bucket_name)
    file = "tmp/uploads/#{self.file_name.file.filename}"
    open(file, 'wb') do |f|
      bucket.files.get(self.file_name.path) do |chunk,remaining_bytes,total_bytes|
        f.write chunk
      end
    end
    get_business.decrypt(file)
  end
end
