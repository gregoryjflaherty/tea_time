require 'rails_helper'

RSpec.describe Subscription, type: :model do
  describe 'relationships' do
    it { should belong_to(:tea)}
    it { should belong_to(:customer)}
  end

  describe '.instance methods' do
    before(:each) do
      @customer = Customer.create!(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        address: Faker::Address.full_address,
        email: "user1@email.com",
        password: "password1",
      )

      @tea = Tea.create!(
        title: Faker::Tea.variety,
        description: Faker::GreekPhilosophers.quote,
        brew_time: Faker::Number.between(from: 1, to: 4),
        temperature: Faker::Number.between(from: 80, to: 85),
      )
    end

    context 'sets title to users tea subscription' do
      it '.set_title' do
        @subscription = @customer.subscriptions.create!(tea_id: @tea.id, frequency: 1)
        expect(@subscription.title).to eq("#{@customer.first_name}'s #{@tea.title} Subscription")
      end
    end

    context 'sets price based on frequency' do
      it '.set_price' do
        @tea_2 = Tea.create!(
          title: Faker::Tea.variety,
          description: Faker::GreekPhilosophers.quote,
          brew_time: Faker::Number.between(from: 1, to: 4),
          temperature: Faker::Number.between(from: 80, to: 85),
        )

        @subscription_1 = @customer.subscriptions.create!(tea_id: @tea.id, frequency: 3)
        @subscription_2 = @customer.subscriptions.create!(tea_id: @tea_2.id, frequency: 1)

        expect(@subscription_1.price).to be(15)
        expect(@subscription_2.price).to be(5)
      end
    end
  end
end
