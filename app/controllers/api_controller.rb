class ApiController < ActionController::API
  before_action :validate_api_key!
  include ExceptionHandler

  private

  def check_valid_key?
    request.headers['x-api-key'] == 'kla_api'
  end

  def validate_api_key!
    return render json: {status: false, result: nil, errors: "your api key is incorrect"}, status: :forbidden unless check_valid_key?
  end
end
