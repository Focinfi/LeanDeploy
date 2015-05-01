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

class Place < ActiveRecord::Base
  has_many :images
  has_one :html_desc
  
  validates :name, presence: true
  validates :latitude, :longitude, numericality: { greater_than_or_equal_to: 0.01 }
end
