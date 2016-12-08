class SponsorSerializer < ActiveModel::Serializer
  attributes :id, :name, :url, :logo_svg_light, :logo_png_light, :logo_svg_dark, :logo_png_dark, :level
end
