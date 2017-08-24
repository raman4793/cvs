class Transcriber < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :business

  has_many :conversations, as: :sendable, dependent: :destroy
  has_many :conversations, as: :recipientable, dependent: :destroy

  has_many :messages, as: :sendable, dependent: :destroy

  has_many :events, as: :initiatable, dependent: :destroy

  mount_uploader :img, SuperAdminUploaderUploader

  after_create do
    a = self.business.admin
    Conversation.create(sendable: a, recipientable: self)
  end

  def get_jobs
    b = self.business
    jobs = Job.find_by_sql("SELECT * FROM Jobs WHERE user_id IN (SELECT id FROM Users WHERE business_id = #{b.id})")
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

  def get_conversations()
    sent = Conversation.where({sendable: self})
    recieved = Conversation.where({recipientable: self})
    conversations = sent.or(recieved)
  end
end
