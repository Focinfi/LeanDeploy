require 'rails_helper'

RSpec.describe Api::PlacesController, :type => :controller do
  describe "api for places' list" do
    let(:error_msg) {
      [{ "error" => "page或per_page参数不是数字字符串" }]
    }
    it "return error if request params page in invalid" do
      get :index, page: "a1"
      expect(JSON.parse(response.body)).to eq error_msg
    end

    it "return error if request params page in invalid" do
      get :index, per_page: "12s"
      expect(JSON.parse(response.body)).to eq error_msg
    end

    it "return valid " do
      # get :index
      # expect(
      #   %w{ id name latitude longitude business_hours description picture_url created_at}.to_set
      # ).to eq JSON.parse(response.body).first.keys.to_set
    end
  end

  describe "api for one place" do
    it "raise return error" do 
      expect {
       get :show, id: "1"
       }.to raise_error(Lina::ReturnCheckError)   
    end
  end

  describe "api for create one place" do
    it "raise params error if params is lack of required-params" do
      expect {
       post :create 
       }.to raise_error(Lina::ParamsCheckError)
    end

    # it "return true if params is right" do
    #   post :create, 
    #         name: "Kyoto Libray", 
    #         longitude: "113", 
    #         latitude: "21",
    #         category: "图书馆",
    #         picture_01: File.open("#{Rails.root}/app/assets/images/library.png"),
    #         picture_01: File.open("#{Rails.root}/app/assets/images/library.png"),
    #         picture_01: File.open("#{Rails.root}/app/assets/images/library.png")
    #   expect(JSON.parse(response.body).created).to eq true                 
    # end
  end
end
