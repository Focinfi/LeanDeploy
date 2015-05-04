class PlacesController < ApplicationController
  before_action :set_place, only: [:show, :edit, :update, :destroy]
  
  # GET /places
  def index
    @places = Place.paginate(page: params[:page]).order(created_at: :desc)
  end
  
  # GET /places/1
  def show
    @place.update(view_times: @place.view_times + 1)
  end
  
  # GET /places/new
  def new
    @place = Place.new    
  end

  # POST /places
  def create
    @place = Place.new(place_params)

    if @place.save
      unless @place.build_html_desc(html_doc: params[:html_doc]).save
        redirect_to new_places_path
        return
      end

      redirect_to @place, notice: "新建成功"
    else
      render :new
    end
  end
  
  def upload_imgs
    
  end

  # GET /places/1
  def edit
  end

  # PATCH/PUT /places/1
  def update
    place_params[:picture] ||= @place.picture
    if @place.update(place_params) && @place.html_desc.update(html_doc: params[:html_doc])
      redirect_to @place, notice: "更新成功"
    else
      render :edit
    end
  end

  # DELETE /places/1
  def destroy
    @place.destroy
    redirect_to places_path, notice: "删除成功"
  end
  
  private
    def set_place
      @place = Place.find(params[:id])
    end
    
    def place_params
      params.require(:place).permit(:name, :latitude, :longitude, :business_hours, :description, :author, :picture, :picture_cache)
    end
end
