require 'openssl'
class Business < ApplicationRecord
  belongs_to :type
  belongs_to :admin
  has_many :users, dependent: :destroy
  belongs_to :plan
  has_many :transcribers, dependent: :destroy

  accepts_nested_attributes_for :admin

  attr_accessor :stripe_card_token

  has_many :events, as: :eventable, dependent: :destroy

  before_create do
    keychars=("ai".."z").to_a + ("A".."Z").to_a + (0..9).to_a
    k=OpenSSL::Digest::SHA256.new.digest(keychars.sample(8).join(",").gsub(",",""))
    self.key=k
  end

  after_create do
    Event.create(initiatable: admin, eventable: self, message: 'business created')
  end

  def save_with_plan
    if valid?
      puts("Stripe Card Token #{self.stripe_card_token}")
      customer = Stripe::Customer.create(description: self.admin.email,plan: self.plan_id, card: self.stripe_card_token)
      self.customer_token = customer.id
      save!
    end
  rescue Stripe::InvalidRequestError => e
    logger.error "Stripe error while creating customer: #{e.message}"
    errors.add :base, "There was a problem with your credit card."
    false
  end

  def current_period
    period = current_period_date
    period_start = Time.at(period[:start_period]).to_datetime.utc
    period_end = Time.at(period[:end_period]).to_datetime.utc
    {period_start: period_start, period_end: period_end}
  end

  def current_period_date
    customer = Stripe::Customer.retrieve(self.customer_token)
    plan = customer.subscriptions
    start_period = plan.data.first.current_period_start
    end_period = plan.data.first.current_period_end
    {start_period: start_period, end_period: end_period}
  end

  def encrypt(file)
    data = File.read(file)
    puts("file read #{data}")
    cipher=OpenSSL::Cipher.new("AES-256-CBC")
    cipher.encrypt
    cipher.key=self.key
    encrypted = cipher.update(data) + cipher.final
    File.open(file, 'wb') { |f| f.write(encrypted) }
  end

  def decrypt(file)
    data = File.read(file)
    decipher=OpenSSL::Cipher.new("AES-256-CBC")
    decipher.decrypt
    decipher.key=self.key
    plain = decipher.update(data) + decipher.final
  end

end
