class V1::CloudflareUsersController < ApiController
  before_action :set_data, only: [:show, :update, :destroy]

  def index
    @data = CloudflareUser.all.order(id: :asc)
    set_response
  end

  def show
    set_response
  end

  def create
    @data = CloudflareUser.create!(data_params)
    set_response
  end

  def update
    @data.update!(data_params)
    set_response
  end

  def destroy
    @data.destroy!
    set_response
  end

  private

  def set_data
    @data = CloudflareUser.find_by!(id: params[:id])
  end

  def set_response
    render json: {status: true, result: @data, errors: nil}, status: :ok
  end

  def data_params
    params.permit(:email, :api_key)
  end
end
