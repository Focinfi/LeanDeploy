# == Schema Information
#
# Table name: places
#
#  id          :integer          not null, primary key
#  name        :string          名称
#  description :text            简单介绍
#  imgUrl      :string          图片地址
#  longtitude  :float           
#  latitude    :float
#  intro       :string           简单介绍
#  html        :text             webview 显示的html
#  author      :string           录入作者
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Place < ActiveRecord::Base
end
