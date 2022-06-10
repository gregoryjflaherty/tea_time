require 'rails_helper'

RSpec.describe 'Login', type: :request do
  scenario 'Sad Path ~ Must log in to create subscription' do
    headers = { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json'}

    @params = {
                     "tea": 'green',
                     "frequency": 3
                     }

    post api_v1_subscriptions_path, :params => @request_body, as: :json

    expected = JSON.parse(response.body, symbolize_names: true)

    expect(response).not_to be_successful
    expect(response.status).to eq(401)
    expect(expected.keys).to include(:message)
    expect(expected[:message]).to eq("Unauthorized: Please log in first")
  end

  scenario 'Happy Path ~ Successful subscription creation, 201 response' do
    Customer.destroy_all
    Tea.destroy_all
    @tea = Tea.create!(title: "Green",description: Faker::GreekPhilosophers.quote,brew_time: Faker::Number.between(from: 1, to: 4),temperature: Faker::Number.between(from: 80, to: 85))
    @customer = Customer.create(
      email: "fake@user.com",
      password: "test"
    )

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


    @params = {
                     "tea": 'green',
                     "frequency": 3
                     }

    post api_v1_subscriptions_path, :params => @params, as: :json

    expected2 = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.status).to eq(201)
    expect(expected2.keys).to include(:data)
    expect(expected2[:data][:type]).to eq("subscriptions")
    expect(expected2[:data][:attributes].keys).to include(:customer_id)
    expect(expected2[:data][:attributes].keys).to include(:tea_id)
    expect(expected2[:data][:attributes].keys).to include(:price)
    expect(expected2[:data][:attributes].keys).to include(:status)
    expect(expected2[:data][:attributes].keys).to include(:frequency)
    expect(expected2[:data][:attributes][:frequency]).to eq(3)
    expect(expected2[:data][:attributes][:tea_id]).to eq(@tea.id)
    expect(expected2[:data][:attributes][:customer_id]).to eq(@customer.id)
    expect(expected2[:data][:attributes][:status]).to eq("active")
    expect(expected2[:data][:attributes][:price]).to eq(15)
  end

  scenario 'Sad Path ~ Tea Not Found' do
    Customer.destroy_all
    Tea.destroy_all
    @tea = Tea.create!(title: "Green",description: Faker::GreekPhilosophers.quote,brew_time: Faker::Number.between(from: 1, to: 4),temperature: Faker::Number.between(from: 80, to: 85))
    @customer = Customer.create(
      email: "fake@user.com",
      password: "test"
    )

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


    @params = {
                     "tea": 'orange cypress',
                     "frequency": 3
                     }

    post api_v1_subscriptions_path, :params => @params, as: :json

    expected2 = JSON.parse(response.body, symbolize_names: true)

    expect(response).not_to be_successful
    expect(response.status).to eq(404)
    expect(expected2.keys).to include(:message)
    expect(expected2[:message]).to eq("Tea not found")
  end
end
