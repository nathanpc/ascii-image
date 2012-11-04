#!/usr/bin/env ruby

require 'rubygems'
require '../lib/ascii-image.rb'

ascii = ASCII_Image.new("poster.jpg")
ascii.build(80)
