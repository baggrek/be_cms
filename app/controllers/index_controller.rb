class IndexController < ApiController
  def home
    render json: {status: true, result: "server it's up", error: nil}, status: 200
  end
end