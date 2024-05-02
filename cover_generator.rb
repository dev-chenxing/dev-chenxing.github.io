# frozen_string_literal: true

# generator for epub cover
class CoverGenerator
  require 'RMagick'
  include Magick

  image = Image.read('cover_template.png').first

  text = Magick::Draw.new
  text.font_family = 'simsun.ttf'
  text.fill = '#312819'
  text.pointsize = 80
  text.gravity = CenterGravity
  text.annotate(image, 0, 0, 0, 0, '女仙外史')

  image.write('cover.png')
end
