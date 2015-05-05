class HtmlDescController < ApplicationController

  before_action :set_html_desc, only: [:update]
  before_action :html_desc_params, only: [:update]
  # GET /places/:place_id/html_desc/new
  def edit
    # render json: params
    @html_desc = HtmlDesc.find(params[:id])
    @place = Place.find(@html_desc.place_id)
    # @html_desc = @place.html_desc || @place.create_html_desc
    # @html_desc = HtmlDesc.find(params[:id])
  end

  def update
    if @html_desc.update(html_desc_params) 
      redirect_to @html_desc.place
    else
      render :edit
    end
  end

  private 
  def html_desc_params
    params.require(:html_desc).permit(:html_doc)    
  end
  def set_html_desc
    @html_desc = HtmlDesc.find(params[:id])
  end
end
