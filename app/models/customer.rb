class Customer < ApplicationRecord
  validates_presence_of :email
  validates_uniqueness_of :email

  has_secure_password
  has_many :subscriptions
end
