class Plan < ApplicationRecord

  has_many :businesses

  def days
    duration
  end

  def weeks
    duration/7
  end

  def months

  end
end
