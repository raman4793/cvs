require 'openssl'
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :uploads, dependent: :destroy
  has_many :jobs
  belongs_to :business

  has_many :conversations, as: :sendable, dependent: :destroy
  has_many :conversations, as: :recipientable, dependent: :destroy
  has_many :messages, as: :sendable, dependent: :destroy

  has_many :events, as: :eventable, dependent: :destroy
  has_many :events, as: :initiatable, dependent: :destroy

  mount_uploader :img, SuperAdminUploaderUploader

  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validate :password_confirm


  def password_confirm
    if password==password_confirmation
      true
    else
      errors.add(:password_confirmation, 'Password do not match')
    end
  end

  def eventable
    Event.where(eventable: self)
  end

  after_create do
    a = self.business.admin
    Conversation.create(sendable: a, recipientable: self)
    Event.create(initiatable: current_admin, eventable: self, message: 'created user')
  end




  #this method is called by devise to check for "active" state of the model
  def active_for_authentication?
    #remember to call the super
    #then put our own check to determine "active" state using
    #our own "is_active" column
    super and self.business.approved?
  end

  def no_of_files_uploaded(period)
    self.uploads.where("created_at BETWEEN ? AND ?", period[:period_start], period[:period_end]).count
  end

  def no_of_lines(period)
    self.jobs.where("created_at BETWEEN ? AND ?", period[:period_start], period[:period_end]).sum(:nol)
  end

#   def key
#     encrypted_key
#   end
#
#   def key=(key)
#     encrypted_key=key
#   end
#
#
#
#   def encrypt(data)
# # create the cipher for encrypting
#     cipher = OpenSSL::Cipher.new('aes-256-cbc')
#     cipher.encrypt
#
# # you will need to store these for later, in order to decrypt your data
#
# # load them into the cipher
# #     k = cipher.random_key
#     k=Digest::SHA1.hexdigest("00001100 10001101 01110101 00011010 01110011 01101011 11101100 01110011
# 11000011 11100000 01001011 11001001 11000010 10011011 01100001 10011011
# 00110101 10111101 10010110 00000101 11000110 11101001 01011111 00111110
# 01010100 00001111 01010011 11001110 10001101 00110010 10101101 00101101")
#     puts("The kye #{k}")
#     v = cipher.random_iv
#     puts("The iv #{iv}")
#
#     cipher.key = k
#     cipher.iv = v
#
# # encrypt the message
#     encrypted = cipher.update(data) + cipher.final
#     # puts "encrypted: #{encrypted}\n"
#     # encrypted
#
#
#     decipher = OpenSSL::Cipher.new('aes-256-cbc')
#     decipher.decrypt
#     decipher.key = k
#     decipher.iv = v
#
# # and decrypt it
#     decrypted = decipher.update(encrypted) + decipher.final
#     # puts "decrypted: #{decrypted}\n"
#     # decrypted
#   end
#
#   def decrypt(data)
# # now we create a sipher for decrypting
#     decipher = OpenSSL::Cipher.new('aes-256-cbc')
#     decipher.decrypt
#     decipher.key = Digest::SHA1.hexdigest(updated_at.to_s)
#     decipher.iv = Digest::SHA1.hexdigest(created_at.to_s)
#
# # and decrypt it
#     decrypted = decipher.update(encrypted) + decipher.final
#     puts "decrypted: #{decrypted}\n"
#     decrypted
#   end

  def can_upload?
    period = self.business.current_period
    current_files_count = no_of_files_uploaded(period)
    current_line_count = no_of_lines(period)

    if current_files_count < self.business.plan.number_of_files and current_line_count <  self.business.plan.number_of_lines
      true
    else
      false
    end
  end

  def usage
    self.jobs.sum(&:file_size)
  end

  def get_usage_percent
    plan = business.plan
    total_size = plan.size_of_files
    current_size = jobs.sum(&:file_size)
    ((current_size/(1024*1024))/(total_size).to_f)*100
  end

  def usage_left
    period = {period_start: self.created_at, period_end: Time.now.utc}
    nof = no_of_files_uploaded(period)
    nol = no_of_lines(period)
    plan = self.business.plan
    nof = plan.number_of_files-nof
    nol = plan.number_of_lines-nol
    {nol: nol, nof: nof}
  end

  def current_period_files
    period = self.business.current_period
    from = period[:from]
    to = period[:to]
    self.uploads.where('created_at BETWEEN ? AND ?', from, to)
  end

  def current_period_files_count
    period = self.business.current_period
    from = period[:from]
    to = period[:to]
    self.uploads.where('created_at BETWEEN ? AND ?', from, to).count
  end

  def with_in_limit?
    current_period_files_count < self.business.plan.number_of_files
  end

  def send_message(to, msg)
    conversation = Conversation.where({sendable: self, recipientable: to}).first
    if conversation.nil?
      conversation = Conversation.where({sendable: to, recipientable: self}).first
    end
    if conversation.nil?
      conversation = Conversation.create({sendable: self, recipientable: to})
    end
    conversation.messages.create(content: msg, sendable: self)
  end

  def get_messages(from)
    conversation = Conversation.where({sendable: self, recipientable: from}).first
    if conversation.nil?
      conversation = Conversation.where({sendable: from, recipientable: self}).first
    end
    if conversation.nil?
      nil
    else
      conversation.messages
    end
  end

  def self.get_conversation(from, to)
    conversation = Conversation.where({sendable: from, recipientable: to}).first
    if conversation.nil?
      conversation = Conversation.where({sendable: to, recipientable: from}).first
    end
  end

  def get_conversations
    sent = Conversation.where({sendable: self})
    recieved = Conversation.where({recipientable: self})
    conversations = sent.or(recieved)
  end

  private

end
