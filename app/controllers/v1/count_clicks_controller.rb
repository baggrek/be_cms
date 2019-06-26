class V1::CountClicksController < ApiController
  skip_before_action :check_admin, only: [:create]

  def index
    # binding.pry
    @data = Content.joins(:content_details).order(id: :asc)
    set_response
  end

  def show
    row_data = Content.find_by!(id: params[:content_id])
    @data = row_data.content_details.sum("click")
    set_response
  end

  def create
    @data = ContentDetail.click_count(params[:airplane_id], params[:content_id])
    set_response
  end

  private

  def set_response
    render json: {status: true, result: @data, errors: nil}, status: :ok
  end

  def data_params
    params.permit(:click, :airplane_id, :content_id)
  end
end