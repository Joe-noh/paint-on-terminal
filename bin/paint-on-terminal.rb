#! /usr/bin/ruby
#-*- coding: utf-8-*-

require "RMagick"
require "rainbow"

def to256(p)
  r = ((p.red/65535.0)*255).to_i
  g = ((p.green/65535.0)*255).to_i
  b = ((p.blue/65535.0)*255).to_i

  Magick::Pixel.new(r, g, b)
end

if __FILE__ == $0
  img = Magick::ImageList.new(ARGV.first).first

  img.rows.times do |y|
    img.columns.times do |x|
      p = to256(img.pixel_color(x, y))
      print "  ".background(p.red, p.green, p.blue)
    end
    puts
  end
end
