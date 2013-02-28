#!/usr/bin/env ruby

require 'rubygems'
require 'RMagick'
require 'rainbow'
require 'open-uri'

# == Summary
# 
# This handy Ruby gem will help you to create awesome ASCII art from images
# for your awesome command-line projects.
# 
# == Example
# 
#   ascii = ASCII_Image.new("file.jpg")
#   ascii.build(80)
# 
# == Contact
# 
# Author:: Nathan Campos (nathanpc@dreamintech.net)
# Website:: http://about.me/nathanpc

class ASCII_Image
    # Initialize the ASCII_Image class.
    # 
    # An Error is raised if your ImageMagick quantum depth is higher than 8.
    # 
    # Arguments:
    #   uri: (String)
    #   console_width: (Integer)
    
    def initialize(uri, console_width = 80)
        @uri = uri
        @console_width = console_width
        
        if Magick::QuantumDepth > 8
            raise "Your ImageMagick quantum depth is set to #{Magick::QuantumDepth}. You need to have it set to 8 in order for this app to work."
        end
    end
    
    # Convert the image into ASCII and print it to the console.
    # 
    # An ArgumentError is raised if the +width+ is bigger than the +console_width+
    # 
    # Arguments:
    #   width: (Integer)
    
    def build(width)
        # Open the resource
        resource = open(@uri)
        image = Magick::ImageList.new
        image.from_blob resource.read
        
        # Resize to the desired "text-pixel" size
        if width > @console_width
            raise ArgumentError, "The desired width is bigger than the console width"
        end
        
        image = image.scale(width / image.columns.to_f)
        # Compensate the height of the console "text-pixel"
        image = image.scale(image.columns, image.rows / 1.7)
        
        # Get the pixel array
        image.each_pixel do |pixel, col, row|
            print " ".background(pixel.red, pixel.green, pixel.blue)
            
            if (col % (width - 1) == 0) and (col != 0)
                print "\n"
            end
        end
    end
end
