require 'rails_helper'

RSpec.describe Api::PlacesController, :type => :controller do
  describe "api for places' list" do
    let(:error_msg) {
      { "error" => "page或per_page参数不是数字字符串", "status" => "400" }
    }

    it "return error if request params page in invalid" do
      get :index, page: "a1"
      expect(JSON.parse(response.body)).to eq error_msg
    end

    it "return error if request params page in invalid" do
      get :index, per_page: "12s"
      expect(JSON.parse(response.body)).to eq error_msg
    end

    it "return  " do
      get :index
    end
  end

  describe "api for create one place" do
    it "raise params error if params is lack of required-params" do
      post :create, name: "library", category: "XXX"
      expect(JSON.parse(response.body)).to eq({ "created" => false, "status" => "400" })
    end

    it "return true if params is right" do
      place = Place.new(            
            name: "Kyoto Libray", 
            longitude: "113", 
            latitude: "21",
            category: "图书馆",
            picture_01: File.open("#{Rails.root}/app/assets/images/library.png"),
            picture_01: File.open("#{Rails.root}/app/assets/images/library.png"),
            picture_01: File.open("#{Rails.root}/app/assets/images/library.png"))
      post :create, place.attributes
      expect(JSON.parse(response.body)["created"]).to eq true       
      place.delete      
    end
  end

  describe "api for create one place" do
    it "raise params error if params is lack of required-params" do
      post :upload, name: "library"
      expect(JSON.parse(response.body)).to eq({ "created" => false, "status" => "400" })
    end

    it "return true if params is right" do
      place = Place.new( 
            name: "Kyoto Libray", 
            description: "读书好地方",
            picture_01: File.open("#{Rails.root}/app/assets/images/library.png"))
      post :upload, place.attributes
      expect(JSON.parse(response.body)["created"]).to eq true 
      
      place.delete
    end
  end
end
