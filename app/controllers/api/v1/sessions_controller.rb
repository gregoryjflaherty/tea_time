class Api::V1::SessionsController < ApplicationController
  before_action :find_customer

  def create
    customer = Customer.find_by(email: (params[:email]))
    if @customer.nil?
      render json: {message: "Password/Email combination does not match"}, status: 422
    elsif @customer.authenticate(params[:password]) != @customer
      render json: {message: "Password/Email combination does not match"}, status: 422
    else
      session[:customer_id] = @customer.id
      render json: {message: "#{@customer.email} has been logged in"}, status: 200
    end
  end


  def destroy
    session[:customer_id] = nil
    render json: {message: "#{@customer.email} has been logged out"}, status: 200
  end

  private
    def find_customer
      @customer = Customer.find_by(email: (params[:email]))
    end
end
