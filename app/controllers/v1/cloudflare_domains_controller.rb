class V1::CloudflareDomainsController < ApiController
  before_action :set_data, only: [:show, :update, :destroy, :create]

  def index
    @data = CloudflareDomain.get_all_data
    set_response
  end

  def show
    @data = @flare_user.cloudflare_domains.find_by(id: params[:id])
    set_response
  end

  def create
    @data = @flare_user.cloudflare_domains.create!(data_params)
    set_response
  end

  def update
    @data = @flare_user.cloudflare_domains.find_by!(id: params[:id]).update(data_params)
    @data = CloudflareDomain.find_by(id: params[:id])
    set_response
  end

  def destroy
    @data = @flare_user.cloudflare_domains.find_by(id: params[:id]).destroy!
    set_response
  end

  private

  def set_data
    @flare_user = CloudflareUser.find_by!(id: params[:id_cloudflare_user])
  end

  def set_response
    render json: {status: true, result: @data, errors: nil}, status: :ok
  end

  def data_params
    params.permit(:domain, :zone_id, :cloudflare_user_id)
  end
end
