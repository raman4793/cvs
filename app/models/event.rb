class Event < ApplicationRecord
  belongs_to :eventable, polymorphic: true
  belongs_to :initiatable, polymorphic: true

  def self.get_events(user)
    if user.class.name == 'Admin'
      get_admin_events(user)
    elsif user.class.name == 'User'
      Event.where(initiatable: user).or(Event.where(initiatable: Transcriber.find_by(business: user.business)))
    elsif user.class.name == 'Transcriber'
      user.events
    end
  end

  def self.get_admin_events(user)
    admin_initiated = Event.where(initiatable: user)
    if !admin_initiated.nil?
      ids = user.users
      user_initiated = Event.where(initiatable: ids)
      if !user_initiated.nil?
        admin_initiated = admin_initiated.or(user_initiated)
      end
      transcriber_initiated = Event.where(initiatable: user.business.transcribers)
      if !transcriber_initiated.nil?
        admin_initiated = admin_initiated.or(transcriber_initiated)
      end
    end
    admin_initiated
  end
end
