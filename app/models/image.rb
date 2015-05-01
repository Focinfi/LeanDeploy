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
end
