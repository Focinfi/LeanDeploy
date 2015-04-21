# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  place_id   :integer
#  content    :text  
#  userId     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Comment < ActiveRecord::Base
end
