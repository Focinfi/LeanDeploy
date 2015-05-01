class PlacesController < ApplicationController
<<<<<<< HEAD
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
=======
  before_action :set_place, only: [:show, :edit, :update, :destroy]

  # GET /places
  # GET /places.json
  def index
    @places = Place.all
  end

  # GET /places/1
  # GET /places/1.json
  def show
  end

  # GET /places/new
  def new
    @place = Place.new
  end

  # GET /places/1/edit
  def edit
  end

  # POST /places
  # POST /places.json
  def create
    @place = Place.new(place_params)

    respond_to do |format|
      if @place.save
        format.html { redirect_to @place, notice: 'Place was successfully created.' }
        format.json { render :show, status: :created, location: @place }
      else
        format.html { render :new }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /places/1
  # PATCH/PUT /places/1.json
  def update
    respond_to do |format|
      if @place.update(place_params)
        format.html { redirect_to @place, notice: 'Place was successfully updated.' }
        format.json { render :show, status: :ok, location: @place }
      else
        format.html { render :edit }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /places/1
  # DELETE /places/1.json
  def destroy
    @place.destroy
    respond_to do |format|
      format.html { redirect_to places_url, notice: 'Place was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_place
      @place = Place.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def place_params
      params.require(:place).permit(:name, :description, :imgUrl, :longtitude, :latitude, :intro, :html, :author)
>>>>>>> b7f7b50afb90b5c2c98eee9b561b30b5b4105590
    end
end
