# == Schema Information
#
# Table name: places
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  latitude       :float(24)
#  longitude      :float(24)
#  business_hours :string(255)
#  description    :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'rails_helper'

RSpec.describe Place, :type => :model do
  
  before do
    @place = Place.new({
      name: "Nice Libray",
      latitude: 1.0,
      longitude: 1.0})
  end
  
  it "invalid without a name" do 
    expect(Place.new).not_to be_valid
  end
  
  it "invalid the name is blank" do 
    expect(Place.new(name: "")).not_to be_valid
  end
  
  it "invalid latitude or longitude < 0" do 
    @place.latitude = -1.0
    expect(@place).not_to be_valid
    
    @place.latitude = 0 
    expect(@place).not_to be_valid
    
    @place.latitude = 1 
    expect(@place).to be_valid
  end
end



