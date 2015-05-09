require 'rails_helper'

RSpec.describe PlacesController, :type => :controller do
  let(:valid_attributes) {
    attributes_for(:place)
  }

  let(:invalid_attributes) {
    attributes_for(:place, category: "XXX")
  }

  describe "POST create" do
    context "with valid params" do
      it "creates a new Place" do
        expect {
          post :create, place: valid_attributes
        }.to change(Place, :count).by(1)
      end

      it "creates a new HtmlDesc Model when place is created" do 
        expect {
          post :create, place: valid_attributes
        }.to change(HtmlDesc, :count).by(1)
      end

      it "redirects to the html_desc edit page" do
        post :create, place: valid_attributes
        expect(response).to redirect_to(edit_html_desc_path(Place.last.html_desc))
      end

    end

    context "with invalid params" do
      it "assigns a newly created but unsaved place as @place" do
        expect{
          post :create, place: invalid_attributes
        }.to_not change(Place, :count)
      end
    end
  end

  describe "PUT update" do
    context "valid  attributes" do
      it "locates the requested place" do    
        # patch :update, id: @place, place: valid_attributes
        # expect(assigns(:place)).to eq @place
      end
    end
  end  
  
  describe "DELETE destroy" do
    before :each do 
      @place = Place.create!(name: "Lib", 
                             longitude: 123, 
                             latitude: 21, 
                             category: Place::CATEGORY_TYPES[1]) 
    end
    it "delete a place model" do
      delete :destroy, { id: @place.to_param }
      expect(Place.find_by_id(@place.id)).to be_nil
    end

    it "delete its html_desc" do 
      html_desc = HtmlDesc.create!(place_id: @place.id)
      delete :destroy, { id: @place.to_param }
      expect(HtmlDesc.find_by_id html_desc.id).to be_nil
    end

    it "delete its image" do
      image = Image.create!(place_id: @place.id, url: "/example.png")
      delete :destroy, { id: @place.to_param }
      expect(Image.find_by_id(image.id)).to be_nil
    end
  end
end
