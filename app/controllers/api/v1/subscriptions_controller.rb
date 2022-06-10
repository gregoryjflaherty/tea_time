class Api::V1::SubscriptionsController < ApplicationController
  before_action :authorize
  before_action :check_tea, only: [:create]



  def create
    customer = Customer.find_by(id: session[:customer_id])
    subscription = customer.subscriptions.create!(tea_id: @tea.id, frequency: params[:frequency])
    render json: SubscriptionsSerializer.new(subscription), status: 201
  end

  private

  def check_tea
    @tea = Tea.find_by(title: params[:tea].downcase.titleize)
    if @tea.nil?
      render json: {message: "Tea not found"}, status: 404
    else
      @tea
    end
  end
end
