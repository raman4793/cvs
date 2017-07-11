class Business < ApplicationRecord
  belongs_to :type
  belongs_to :admin
  has_many :users
end
