class IndexController < ApiController
  skip_before_action :validate_api_key!, :check_admin
  
  def home
    render json: {status: true, result: "server it's up", error: nil}, status: 200
  end
end