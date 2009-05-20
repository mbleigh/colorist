Gem::Specification.new do |s|
  s.name = "colorist"
  s.version = "0.0.3"
  s.date = "2008-08-16"
  s.summary = "A library built to handle the easy conversion and simple manipulation of colors."
  s.email = "michael@intridea.com"
  s.homepage = "http://github.com/mbleigh/colorist"
  s.description = "Colorist is a library built to handle the easy conversion and manipulation of colors with a special emphasis on W3C standards and CSS-style hex color notation."
  s.has_rdoc = true
  s.authors = ["Michael Bleigh"]
  s.files = [ "MIT_LICENSE.rdoc",
              "README.rdoc",
              "CHANGELOG.rdoc",
              "lib/colorist.rb",
              "lib/colorist/color.rb",
              "lib/colorist/core_extensions.rb" ]
  s.rdoc_options = ["--main", "README.rdoc"]
  s.extra_rdoc_files = ["MIT_LICENSE.rdoc", "README.rdoc"]
end