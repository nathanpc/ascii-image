Gem::Specification.new do |s|
    s.name        = "ascii-image"
    s.version     = "0.1.4"
    s.license     = "GPL-3.0-or-later"
    s.summary     = "Convert images into ASCII"
    s.description = "A Ruby gem to convert images into ASCII for your awesome command-line applications"
    s.authors     = ["Nathan Campos"]
    s.email       = "nathan@innoveworkshop.com"
    s.files       = ["lib/ascii-image.rb"]
    s.homepage    = "https://github.com/nathanpc/ascii-image"

    s.add_dependency "rainbow", ">= 3.0.0"
    s.add_dependency "rmagick", ">= 2.16.0"
end
