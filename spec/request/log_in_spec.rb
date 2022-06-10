require 'rails_helper'

RSpec.describe 'Login', type: :request do
  scenario 'Sad Path ~ Password doesnt match, 422 response' do
    Customer.destroy_all
    Customer.create(
      email: "fake@user.com",
      password: "test"
    )

    headers = { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json'}

    @request_body = {
                     "email": 'fake@user.com',
                     "password": 'testt'
                     }

    post api_v1_log_in_path, :params => @request_body, as: :json

    expected = JSON.parse(response.body, symbolize_names: true)

    expect(response).not_to be_successful
    expect(response.status).to eq(422)
    expect(expected.keys).to include(:message)
    expect(expected[:message]).to eq("Password/Email combination does not match")
  end

  scenario 'Sad Path ~ Email doesnt match, 422 response' do
    Customer.destroy_all
    Customer.create(
      email: "fake@user.com",
      password: "test"
    )

    headers = { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json'}

    @request_body = {
                     "email": 'faker@user.com',
                     "password": 'test'
                     }

    post api_v1_log_in_path, :params => @request_body, as: :json

    expected = JSON.parse(response.body, symbolize_names: true)

    expect(response).not_to be_successful
    expect(response.status).to eq(422)
    expect(expected.keys).to include(:message)
    expect(expected[:message]).to eq("Password/Email combination does not match")
  end

  scenario 'Sad Path ~ Blank Email, 422 response' do
    Customer.destroy_all
    Customer.create(
      email: "fake@user.com",
      password: "test"
    )

    headers = { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json'}

    @request_body = {
                     "password": 'test'
                     }

    post api_v1_log_in_path, :params => @request_body, as: :json

    expected = JSON.parse(response.body, symbolize_names: true)

    expect(response).not_to be_successful
    expect(response.status).to eq(422)
    expect(expected.keys).to include(:message)
    expect(expected[:message]).to eq("Password/Email combination does not match")
  end

  scenario 'Sad Path ~ Blank password, 422 response' do
    Customer.destroy_all
    Customer.create(
      email: "fake@user.com",
      password: "test"
    )

    headers = { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json'}

    @request_body = {
                     "email": 'faker@user.com'
                     }

    post api_v1_log_in_path, :params => @request_body, as: :json

    expected = JSON.parse(response.body, symbolize_names: true)

    expect(response).not_to be_successful
    expect(response.status).to eq(422)
    expect(expected.keys).to include(:message)
    expect(expected[:message]).to eq("Password/Email combination does not match")
  end

  scenario 'Happy Path ~ 200 response' do
    Customer.destroy_all
    customer = Customer.create(
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
    expect(expected[:message]).to eq("#{customer.email} has been logged in")
  end
end
