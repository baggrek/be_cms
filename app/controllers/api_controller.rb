class ApiController < ActionController::API
  before_action :validate_api_key!, :check_admin
  attr_reader :current_user
  include ExceptionHandler

  private

  def check_valid_key?
    request.headers['x-api-key'] == 'kla_api'
  end

  def validate_api_key!
    return render json: {status: false, result: nil, error: "your api key is incorrect"}, status: :forbidden unless check_valid_key?
  end

  def check_admin
    @current_user = User.find_by!(id: params[:user_id])
    return render json: {status: false, result: nil, error: "You'r Not Admin"}, status: :forbidden unless @current_user.is_admin?
  end
end
