Gem::Specification.new do |s|
    s.name        = "ascii-image"
    s.version     = "0.1.2"
    s.summary     = "Convert images into ASCII"
    s.description = "A Ruby gem to convert images into ASCII for your awesome command-line applications"
    s.authors     = ["Nathan Campos"]
    s.email       = "nathanpc@dreamintech.net"
    s.files       = ["lib/ascii-image.rb"]
    s.homepage    = "https://github.com/nathanpc/ascii-image"

    s.add_dependency "rainbow", ">= 1.1.4"
    s.add_dependency "rmagick", ">= 2.13.1"
end
