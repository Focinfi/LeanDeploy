class PlacesController < ApplicationController
  before_action :set_place, only: [:show, :edit, :update]
  
  def index
  end

  def show
  end
  
  def new
    @place = Place.new    
  end

  # POST /places
  def create
    # for test params

    # render json: params[:html_doc]
    # return
    
    @place = Place.new(place_params)

    if @place.save
      # save image_url
      # if params[:image_urls]
      #   params[:image_urls].each do |image_url|
      #     image = Image.new({
      #       place_id: @place.id,
      #       url: image_url
      #       })

      #     unless image.save
      #       render :new
      #       return
      #     end
      #   end
      # end

      html_desc = HtmlDesc.new({
        place_id: @place.id,
        html_doc: params[:html_doc]
      })

      unless html_desc.save
        render :new 
        return
      end

      # redirect_to @place, notice: "新建成功"
      render json: @place
    else
      render :new
    end


  end
  
  def upload_imgs
    
  end

  def update
  end
  
  private
    def set_place
      @place = Place.find(params[:id])
    end
    
    def place_params
      params.require(:place).permit(:name, :latitude, :longitude, :business_hours, :description)
    end
end
