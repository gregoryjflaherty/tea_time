class Subscription < ApplicationRecord
  before_save :set_title
  before_save :set_price

  belongs_to :customer
  belongs_to :tea

  def set_title
    customer = Customer.find_by(id: self.customer_id)
    tea = Tea.find_by(id: self.tea_id)
    self.title = "#{customer.first_name}'s #{tea.title} Subscription"
  end

  def set_price
    self.price = self.frequency * 5
  end
end
