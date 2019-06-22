class V1::CloudflareDomainDetailsController < ApiController
  before_action :set_data, only: [:show, :update, :destroy, :create]

  def index
    @data = CloudflareDomainDetail.get_all_data(user_id = params[:user_id], domain_id = params[:domain_id])
    set_response
  end

  def show
    @data = @flare.cloudflare_domain_details.find_by(id: params[:id])
    set_response
  end

  def create
    @data = @flare.cloudflare_domain_details.create!(data_params)
    row_sub = CloudflareDomainDetail.create_to_cloudflare(@data.id)
    set_response
  end

  def update
    data = @flare.cloudflare_domain_details.find_by(id: params[:id]).update!(data_params)
    @data = CloudflareDomainDetail.find_by(id: params[:id])
    set_response
  end

  def destroy
    @data = @flare.cloudflare_domain_details.find_by(id: params[:id]).destroy
    set_response
  end

  private

  def set_data
    @flare = CloudflareDomain.find_by!(id: params[:id_domain])
  end

  def set_response
    render json: {status: true, result: @data, errors: nil}, status: :ok
  end

  def data_params
    params.permit(:sub_domain, :type_record, :pointing, :cloudflare_domain_id)
  end
end
