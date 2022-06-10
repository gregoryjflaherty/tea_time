class ApplicationController < ActionController::API
  
  def current_customer
    if session[:customer_id]
      @current_customer = Customer.find(session[:customer_id])
    end
  end

  def authorize
    if !current_customer
      render json: {message: "Unauthorized: Please log in first"}, status: 401
    end
  end
end
