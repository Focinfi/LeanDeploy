# == Schema Information
#
# Table name: likes
#
#  id         :integer          not null, primary key
#  place_id   :integer
#  userId     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Like < ActiveRecord::Base
end
