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
#  category       :string(255)
#

require 'carrierwave/orm/activerecord'

class Place < ActiveRecord::Base
  CATEGORY_TYPES = %w{ 图书馆 咖啡馆 书店 户外 大学 其他 }
  has_many :images, dependent: :destroy
  has_one :html_desc, dependent: :destroy
  # mount_uploaders :pictures, PictureUploader
  mount_uploader :picture_01, PictureUploader
  mount_uploader :picture_02, PictureUploader
  mount_uploader :picture_03, PictureUploader
  self.per_page = 10

  validates_presence_of :name, message: "请填写读觅地点名字"
  # validates_presence_of :picture_01, message: "请上传读觅图片01"
  validates_presence_of :longitude, message: "请点击地图来填写坐标"
  validates_presence_of :latitude, message: ""
  validates_inclusion_of :category, in: CATEGORY_TYPES

  after_destroy :delete_its_relative_res

  def html_doc
    if html_desc
      html_desc.html_doc || "<p>一个适合读书的地方</p>"
    else
      "<p>一个适合读书的地方</p>" 
    end
  end

  def html_url
    "/places/#{id}"
  end

  def picture_urls
    [picture_01_url ,picture_02_url, picture_03_url]
  end

  def temp_image_url
    "http://www.zhangxinxu.com/study/201109/uploads/library.jpeg"
  end

  def picture_01_url
    picture_01.url
  end

  def picture_02_url
    picture_02.url
  end

  def picture_03_url
    picture_03.url
  end

  def remove_all_picture(params)
    # params[:picture_01].to_s
    # picture_01?
    remove_picture_01! if picture_01? && params[:picture_01]
    remove_picture_02! if picture_02? && params[:picture_02]
    remove_picture_03! if picture_03? && params[:picture_03]
  end
  
  private
  def delete_its_relative_res
    html_desc.delete if html_desc
    images.delete_all unless images.empty?
  end
  
end
