require 'openssl'
class Job < ApplicationRecord
  belongs_to :upload
  belongs_to :user

  has_many :events, as: :eventable, dependent: :destroy

  mount_uploader :file_name, TranscriptedFilesUploader

  def business
    user.business
  end

  before_save do
    # size = self.upload.file_name.file.size
    # size+=self.file_name.file.size if self.file_name.file
    # self.file_size=size
    if self.status==Job.statuses[:finished]
      data = draft
      puts"Draft = #{data}"
      fname = "tmp/uploads/job_#{id}.txt"
      file = File.open(fname, 'wb') { |file| file.write(data) }
      puts("File created #{fname}")
      sleep(5)
      file = get_business.encrypt(fname)
      self.file_name = Rails.root.join(fname).open
    end
  end

  def day
    created_at.to_date.to_s
  end

  after_create do
    Event.create(initiatable: self.upload.user, eventable: self, message: 'submitted job')
  end

  after_update do
    if status==Job.statuses[:finished] && file_name.nil?
      if self.upload.user.business.transcribers.first
        Event.create(initiatable: self.upload.user.business.transcribers.first, eventable: self, message: 'finished job')
      end
    end
  end

  def get_event_text

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
      self.draft
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
