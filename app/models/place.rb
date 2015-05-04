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
#  view_times     :integer          default(0)
#  author         :string(255)      default("读觅小编")
#

require 'carrierwave/orm/activerecord'

class Place < ActiveRecord::Base
  CATEGORY_TYPES = %w{ 图书馆 咖啡馆 书店 户外 大学 其他 }
  has_many :images, dependent: :destroy
  has_one :html_desc, dependent: :destroy
  # mount_uploaders :pictures, PictureUploader
  mount_uploader :picture, PictureUploader
  self.per_page = 10

  validates_presence_of :name, message: "请填写读觅地点名字"
  validates_presence_of :longitude, message: "请点击地图来填写坐标"
  validates_presence_of :latitude, message: ""
  validates_inclusion_of :category, in: CATEGORY_TYPES

  after_destroy :delete_its_relative_res

  def html_doc
    if html_desc
      html_desc.html_doc
    else
      "<p>一个适合读书的地方</p>" 
    end
  end

  def html_url
    "/places/#{id}"
  end

  def temp_image_url
    "http://www.zhangxinxu.com/study/201109/uploads/library.jpeg"
  end

  def picture_01_url
    temp_image_url
  end

  def picture_02_url
    temp_image_url
  end

  def picture_03_url
    temp_image_url
  end
  
  private
  def delete_its_relative_res
    html_desc.delete if html_desc
    images.delete_all unless images.empty?
  end
  
end
