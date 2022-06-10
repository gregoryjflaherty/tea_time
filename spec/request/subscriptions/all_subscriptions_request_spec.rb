require 'rails_helper'

RSpec.describe 'Update Subscription', type: :request do
  before(:each) do
    @tea = Tea.create!(title: "Green",description: Faker::GreekPhilosophers.quote,brew_time: Faker::Number.between(from: 1, to: 4),temperature: Faker::Number.between(from: 80, to: 85))
    @tea2 = Tea.create!(title: "Black",description: Faker::GreekPhilosophers.quote,brew_time: Faker::Number.between(from: 1, to: 4),temperature: Faker::Number.between(from: 80, to: 85))
    @customer = Customer.create(
      email: "fake@user.com",
      password: "test"
    )
    @customer2 = Customer.create(
      email: "fake@user2.com",
      password: "test"
    )
    @subscription = Subscription.create(tea_id: @tea.id, customer_id: @customer.id, frequency: 1)
    @subscription2 = Subscription.create(tea_id: @tea2.id, customer_id: @customer.id, frequency: 1, status: "cancelled")
    @subscription2 = Subscription.create(tea_id: @tea2.id, customer_id: @customer2.id, frequency: 2)
  end


  scenario 'Sad Path ~ Must log in to update subscription' do
    headers = { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json'}

    get api_v1_subscriptions_path

    expected = JSON.parse(response.body, symbolize_names: true)

    expect(response).not_to be_successful
    expect(response.status).to eq(401)
    expect(expected.keys).to include(:message)
    expect(expected[:message]).to eq("Unauthorized: Please log in first")
  end

  scenario 'Happy Path ~ Successful subscription update ~ Frequency' do
    headers = { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json'}

    @request_body = {
                     "email": 'fake@user.com',
                     "password": 'test'
                     }

    post api_v1_log_in_path, :params => @request_body, as: :json

    expected = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.status).to eq(200)
    expect(expected.keys).to include(:message)
    expect(expected[:message]).to eq("fake@user.com has been logged in")


    get api_v1_subscriptions_path


    expected2 = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.status).to eq(200)
    expect(expected2.keys).to include(:data)
    expect(expected2[:data].length).to be(2)
    expect(expected2[:data][1][:attributes][:customer_id]).to eq(@customer.id)
    expect(expected2[:data][1][:attributes][:status]).to eq("cancelled")
    expect(expected2[:data][0][:attributes][:customer_id]).to eq(@customer.id)
    expect(expected2[:data][0][:attributes][:status]).to eq("active")
  end
end
