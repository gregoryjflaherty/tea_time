require 'rails_helper'

RSpec.describe 'Log out', type: :request do
  scenario 'Logs out User' do
    Customer.destroy_all
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
    expect(expected[:message]).to eq("#{@customer.email} has been logged in")


    @request_body_2 = {
                     "email": 'fake@user.com'
                     }

    post api_v1_log_out_path, :params => @request_body_2, as: :json
    expected2 = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.status).to eq(200)
    expect(expected2.keys).to include(:message)
    expect(expected2[:message]).to eq("fake@user.com has been logged out")
  end
end
