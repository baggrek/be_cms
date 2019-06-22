module ExceptionHandler
  extend ActiveSupport::Concern

  class AuthenticationError < StandardError; end
  class MissingToken < StandardError; end
  class InvalidToken < StandardError; end
  class ExpiredSignature < StandardError; end
  class DecodeError < StandardError; end
  
  included do
    rescue_from ActiveRecord::RecordInvalid, with: :four_twenty_two
    rescue_from ExceptionHandler::AuthenticationError, with: :unauthorized_request
    rescue_from ExceptionHandler::MissingToken, with: :four_twenty_two
    rescue_from ExceptionHandler::InvalidToken, with: :four_twenty_two
    rescue_from ExceptionHandler::ExpiredSignature, with: :four_ninety_eight
    rescue_from ExceptionHandler::DecodeError, with: :four_zero_one

    rescue_from ActiveRecord::RecordNotFound do |e|
     render json: { status: false, result: nil, error: e.message }, status: :not_found
    end

    rescue_from ActiveRecord::RecordInvalid do |e|
      render json: { status: false, result: nil, error: e.message }, status: :unprocessable_entity
    end
  end

  private

  def four_twenty_two(e)
   render json: { status: false, result: e.message }, status: :unprocessable_entity
  end
 
  def four_ninety_eight(e)
    render json: { status: false, result: e.message }, status: 401
  end

  def four_zero_one(e)
    render json: { status: false, result: e.message }, status: :invalid_token
  end

  def unauthorized_request(e)
    render json: { status: false, result: e.message }, status: :unauthorized
  end
end
