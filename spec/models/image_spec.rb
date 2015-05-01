# == Schema Information
#
# Table name: images
#
#  id         :integer          not null, primary key
#  place_id   :integer
#  url        :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Image, :type => :model do
  it "invalid without url" do 
    expect(Image.new).not_to be_valid
  end

  it "invalid tailing without .png or .gif or .jpg" do
    bad = %w{ nd.png nd.png.gif nd.jpg nd.PNG }
    image = Image.new
    bad.each do |img_url|
      image.url = img_url
      expect(image).to be_valid
    end
  end

  it "valid tailing without .jng or .gif/ or .jp" do
    bad = %w{ nd.jng nd.png.gif/ nd./jpg nd.PNG. }
    image = Image.new
    bad.each do |img_url|
      image.url = img_url
      expect(image).not_to be_valid
    end
  end

end
