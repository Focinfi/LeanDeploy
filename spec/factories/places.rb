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
FactoryGirl.define do
  factory :place do
    name 'KyotoLibray'
    latitude 31.11
    longitude 115.31
    description '静谧的读书圣地'
    picture_01 File.open("#{Rails.root}/public/images/place_example.png")
    picture_02 File.open("#{Rails.root}/public/images/place_example.png")
    picture_03 File.open("#{Rails.root}/public/images/place_example.png")
    view_times 0
    author '读觅小编'
    category '图书馆'
    flag 'rich'
    address '日本京都'
    contact '0843-1234-4321'
  end 
end