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
    context "with valid params" do
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

    context "with invalid params" do
      it "assigns a newly created but unsaved place as @place" do
        post :create, {:place => invalid_attributes}
        expect(assigns(:place)).to be_a_new(Place)
      end
    end
  end

  describe "PUT update" do
    context "delete a model" do
      it "locates the requested place" do    
        # p = Place.create!(name: "Lib", longitude: 123, latitude: 21)  
        # has problem in put :update, NOT METHOD
        # put :update, { id: p.to_param, place: p.attributes }

        # expect(assigns(:palce)).to eq p
      end
    end
  end  
  
  describe "DELETE destroy" do
    before :each do 
      @place = Place.create!(name: "Lib", longitude: 123, latitude: 21) 
    end
    it "delete a place model" do
      delete :destroy, {id: @place.to_param}
      expect(Place.find_by_id(@place.id)).to be_nil
    end

    it "delete its html_desc" do 
      html_desc = HtmlDesc.create!(place_id: @place.id, html_doc: "<p>hello world</p1>")
      delete :destroy, {id: @place.to_param}
      expect(HtmlDesc.find_by_id(html_desc.id)).to be_nil
    end

    it "delete its image" do
      image = Image.create!(place_id: @place.id, url: "/example.png")
      delete :destroy, {id: @place.to_param}
      expect(Image.find_by_id(image.id)).to be_nil
    end
  end
end
