class Plan < ApplicationRecord
  def days
    duration
  end

  def weeks
    duration/7
  end

  def months

  end
end
