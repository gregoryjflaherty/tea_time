class Api::V1::SubscriptionsController < ApplicationController
  before_action :authorize
  before_action :check_frequency, except: [:index]
  before_action :check_tea, only: [:create]

  def index
    customer = Customer.find_by(id: session[:customer_id])
    render json: SubscriptionsSerializer.new(customer.subscriptions), status: 200
  end

  def create
    customer = Customer.find_by(id: session[:customer_id])
    subscription = customer.subscriptions.create!(tea_id: @tea.id, frequency: params[:frequency])
    render json: SubscriptionsSerializer.new(subscription), status: 201
  end

  def update
    subscription = Subscription.find_by(id: params[:id])
    if params[:status]
      subscription[:status] = 'cancelled'
      subscription.save
      render json: SubscriptionsSerializer.new(subscription), status: 200
    elsif params[:frequency]
      subscription[:frequency] = params[:frequency]
      subscription.save
      render json: SubscriptionsSerializer.new(subscription), status: 200
    else
      render json: {message: "Please specify change(s)"}, status: 404
    end
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

  def check_frequency
    if params[:frequency]
      if ![1, 2, 3].include?(params[:frequency].to_i)
        render json: {message: "Please provide a frequency between 1 and 3"}, status: 404
      end
    elsif !params[:frequency] && params[:action] == 'create'
        render json: {message: "Please provide a frequency between 1 and 3"}, status: 404
    end
  end
end
