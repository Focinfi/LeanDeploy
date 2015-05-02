# == Schema Information
#
# Table name: html_descs
#
#  id         :integer          not null, primary key
#  place_id   :integer
#  html_doc   :text(65535)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class HtmlDesc < ActiveRecord::Base
  belongs_to :place
  validates :place_id, presence: true
end
