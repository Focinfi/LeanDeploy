require 'rails_helper'

RSpec.describe PlacesController, :type => :controller do
  fixtures :places
  let(:valid_attributes) {
    places(:place_one).attributes.merge(id: 3)
  }

  let(:invalid_attributes) {
    places(:place_one).attributes.merge(name: "")
  }

  describe "Test Fixture" do
    it "valid_attributes is not empty" do
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

      it "redirects to the created place" do
        post :create, {:place => valid_attributes}
        expect(response).to redirect_to(Place.last)
      end
    
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved place as @place" do
        post :create, {:place => invalid_attributes}
        expect(assigns(:place)).to be_a_new(Place)
      end
    end
  end

  describe "PUT update" do
    let(:new_attributes) {
      places(:place_one).attributes.merge(name: "Coffye")
    }

    let(:place) {
      places(:place_one)
    }
    describe "with valid params" do

    end

    describe "with invalid params" do
    
    end
  end  
end
