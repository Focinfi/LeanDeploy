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
#  picture_01     :string(255)
#  view_times     :integer          default(0)
#  author         :string(255)      default("读觅小编")
#  category       :string(255)
#  picture_02     :string(255)
#  picture_03     :string(255)
#  flag           :string(255)      default("rich")
#  address        :text(65535)
#  contact        :text(65535)
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

  it "invalid without longitude or latitude" do
    expect(Place.new(name: "Libray")).not_to be_valid
    expect(Place.new(name: "Libray", latitude: 12)).not_to be_valid
    expect(Place.new(name: "Libray", longitude: 123)).not_to be_valid
  end

end



