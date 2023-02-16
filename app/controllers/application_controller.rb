class ApplicationController < ActionController::API
  include ActionController::Cookies

  # rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  # rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

  before_action :authorized

  private

  def authorized
    @current_user = User.find_by(id: session[:user_id])
    render json: {errors: ["Please attempt to log in again with the correct credentials."]}, status: :unauthorized unless @current_user
  end

  # def render_not_found_response(exception)
  #   render json: { error: "#{exception.model} not found" }, status: :not_found
  # end

  # def render_unprocessable_entity_response(exception)
  #   render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
  # end

end