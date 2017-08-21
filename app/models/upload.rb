require 'fog'
class Upload < ApplicationRecord
  belongs_to :user
  mount_uploader :file_name, FileUploaderUploader
  has_one :job, dependent: :destroy

  validate :limit

  validate :total_size

  def total_size
    u = self.user
    plan = u.business.plan
    total_size = plan.size_of_files
    current_usage = u.usage
    if current_usage > total_size
      errors.add(:id, 'Your cloud storage limit is up')
    end
  end

  def limit
    if self.user.can_upload?

    else
      errors.add(:user, 'Usage exceeded plan limits')
    end
  end

  def get_file
    connection = Fog::Storage.new({ :provider => "AWS", :aws_access_key_id => Rails.application.secrets.aws_access_key_id, :aws_secret_access_key => Rails.application.secrets.aws_secret_access_key, region: Rails.application.secrets.region })
    bucket = connection.directories.new(:key => Rails.application.secrets.bucket_name)
    file = "tmp/uploads/#{self.file_name.file.filename}"
    open(file, 'wb') do |f|
      bucket.files.get(self.file_name.path) do |chunk,remaining_bytes,total_bytes|
        f.write chunk
      end
    end
    file
  end

end
