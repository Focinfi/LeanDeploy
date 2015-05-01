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

class Image < ActiveRecord::Base
  validates :url, presence: true
  validates :url, allow_blank: false, format: {
    with: /.+\.(png|gif|jpg)\z/i,
    message: "must be a PNG, GIF or JPG image"
  }
end
