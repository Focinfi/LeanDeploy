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

require 'rails_helper'

RSpec.describe HtmlDesc, :type => :model do
  it "invalid without place_id" do
    expect(HtmlDesc.new(html_doc: "A nice place")).not_to be_valid
  end
  
  # it "invalid without html_doc" do
  #   expect(HtmlDesc.new(place_id: 1)).not_to be_valid
  # end
end
