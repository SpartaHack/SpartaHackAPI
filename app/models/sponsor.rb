# == Schema Information
#
# Table name: sponsors
#
#  id             :integer          not null, primary key
#  name           :string           not null
#  level          :string           not null
#  url            :string           not null
#  logo_svg_light :text             not null
#  logo_svg_dark  :text
#  logo_png_light :text             not null
#  logo_png_dark  :text
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Sponsor < ApplicationRecord

  validates :name, :presence => true
  validates :url, :presence => true
  validates :level, :presence => true
  validates :logo_svg_light, :presence => true
  validates :logo_png_light, :presence => true

end
