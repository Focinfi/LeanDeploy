require 'rails_helper'

RSpec.describe PlacesController, :type => :controller do
  fixtures :places
  let(:valid_attributes) {
    places(:place_one).attributes
  }

  let(:invalid_attributes) {
    place = places(:place_one)
    place.name = ""
    place.attributes
  }

  describe "Test Fixture" do
    it ":valid_attributes is not empty" do
      expect(valid_attributes["name"]).to eq "南邮图书馆"
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Place" do
        expect {
          post :create, { place: valid_attributes }
        }.to change(Place, :count).by(1)
      end

      it "creates a new HtmlDesc Model when place is created" do 
        expect {
          post :create, { place: valid_attributes, html_doc: "h1" }
        }.to change(HtmlDesc, :count).by(1)
      end

      it "creates a new Image Model when place is created passing image_urls" do        
        # expect {
        #   post :create, { place: valid_attributes, image_urls: ["i.png", "ii.png"] }
        # }.to change(HtmlDesc, :count).by(2)
      end

  #     it "redirects to the created product" do
  #       post :create, {:product => valid_attributes}, valid_session
  #       expect(response).to redirect_to(Product.last)
  #     end
  #   end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved product as @place" do
        post :create, {:place => invalid_attributes}
        expect(assigns(:place)).to be_a_new(Place)
      end
    end
  end
  
end
