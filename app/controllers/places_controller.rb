class PlacesController < ApplicationController
  before_action :set_place, only: [:show, :edit, :update, :destroy]
  layout 'simple_place', only: :show
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
    render json: place_params.to_s

    return
    @place = Place.new(place_params)
    @html_desc =  @place.build_html_desc(html_doc: params[:html_doc])
    if @place.save
      unless @html_desc.save
        rendr :new
        return
      end

      redirect_to edit_html_desc_path(@html_desc), notice: "新建成功"
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
    # render json: @place.remove_all_picture(place_params)
    # return
    @place.remove_all_picture(place_params)
    if @place.update(place_params)
      redirect_to edit_html_desc_path(@place.html_desc), notice: "更新成功，可以继续更新详细内容"
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
      params.require(:place).permit(:name, :latitude, :longitude, :business_hours,
        :description, :author, :category, :picture_01, :picture_02, :picture_03)
    end
end
