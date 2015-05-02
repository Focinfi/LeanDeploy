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
#  picture        :string(255)
#

require 'carrierwave/orm/activerecord'

class Place < ActiveRecord::Base
  has_many :images
  has_one :html_desc
  # mount_uploaders :pictures, PictureUploader
  mount_uploader :picture, PictureUploader
  self.per_page = 10

  validates :name, presence: true
  validates :latitude, :longitude, numericality: { greater_than_or_equal_to: 0.01 }

  after_destroy :delete_its_relative_res
  
  private
  def delete_its_relative_res
    html_desc.destroy if html_desc
    images.destroy unless images.empty?
  end
end
