class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :business, dependent: :destroy

  has_many :conversations, as: :sendable, dependent: :destroy
  has_many :conversations, as: :recipientable, dependent: :destroy
  has_many :messages, as: :sendable, dependent: :destroy

  has_many :events, as: :initiatable, dependent: :destroy

  validates :email, presence: true
  validates :email, uniqueness: true
  validates :password_confirmation, presence: true

  after_create do
    sa = SuperAdmin.first
    Conversation.create(sendable: sa, recipientable: self)
  end

  def users
    business.users
  end


  def create_user(user_data)
    max = business.plan.number_of_users
    current = business.users.count
    puts("Max = #{max} and current = #{current} max<current = #{max<current}")
    if current<max
      business.users.create(user_data)
    else
      puts('Max User reached')
      errors.add('Max User Reached')
    end
  end

  after_update do
    if is_active?
      self.business.update(approved: true)
    else
      self.business.update(approved: false)
    end
  end


  mount_uploader :img, SuperAdminUploaderUploader

  #this method is called by devise to check for "active" state of the model
  def active_for_authentication?
    #remember to call the super
    #then put our own check to determine "active" state using
    #our own "is_active" column
    super and self.is_active?
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

  def usage
    jobs = Job.find_by_sql("SELECT * FROM Jobs WHERE user_id IN (SELECT id FROM Users WHERE business_id = #{business.id});")
    current_size = jobs.sum(&:file_size)
  end

  def total_size
    plan = business.plan
    plan.number_of_users * plan.size_of_files
  end

  def get_usage_percent
    plan = business.plan
    total_size = plan.number_of_users * plan.size_of_files
    jobs = Job.find_by_sql("SELECT * FROM Jobs WHERE user_id IN (SELECT id FROM Users WHERE business_id = #{business.id});")
    current_size = jobs.sum(&:file_size)
    ((current_size/(1024*1024))/(total_size).to_f)*100
  end

end
