module Colorist
  # Color is the general class for storing and manipulating a color with the
  # Colorist gem. It provides methods to add, subtract, and calculate aspects
  # of the color based on W3C and other standards.
  class Color            
    attr_accessor :r, :g, :b
  
    W3C_COLOR_NAMES = {  "maroon"  => 0x800000,
                         "red"     => 0xff0000,
                         "orange"  => 0xffa500,
                         "yellow"  => 0xffff00,
                         "olive"   => 0x808000,
                         "purple"  => 0x800080,
                         "fuchsia" => 0xff00ff,
                         "white"   => 0xffffff,
                         "lime"    => 0x00ff00,
                         "green"   => 0x008000,
                         "navy"    => 0x000080,
                         "blue"    => 0x0000ff,
                         "aqua"    => 0x00ffff,
                         "teal"    => 0x008080,
                         "black"   => 0x000000,
                         "silver"  => 0xc0c0c0,
                         "gray"    => 0x808080  }

    X11_COLOR_NAMES = {  "alice_blue"          => 0xf0f8ff,
                         "anthique_white"      => 0xfaebd7,
                         "aqua"                => 0x00ffff,
                         "auquamarine"         => 0x7fffd4,
                         "azure"               => 0xf0ffff,
                         "beige"               => 0xf5f5dc,
                         "bisque"              => 0xffe4c4,
                         "black"               => 0x000000,
                         "blanched_almond"     => 0xffebcd,
                         "blue"                => 0x0000ff,
                         "blue_violet"         => 0x8a2be2,
                         "brown"               => 0xa52a2a,
                         "burly_wood"          => 0xdeb887,
                         "cadet blue"          => 0x5f9ea0,
                         "chartreuse"          => 0x7fff00,
                         "chocolate"           => 0xd2691e,
                         "coral"               => 0xff7f50,
                         "cornflower"          => 0x6495ed,
                         "cornslik"            => 0xfff8dc,
                         "crimson"             => 0xdc143c,
                         "cyan"                => 0x00ffff,
                         "dark_blue"           => 0x00008b,
                         "dark_cyan"           => 0x008b8b,
                         "dark_goldenrod"      => 0xb8860b,
                         "dark_gray"           => 0xa9a9a9,
                         "dark_green"          => 0x006400,
                         "dark_khaki"          => 0xbdb76b,
                         "dark_magenta"        => 0x8b008b,
                         "dark_olive_green"    => 0x556b2f,
                         "dark_orange"         => 0xff8c00,
                         "dark_orchid"         => 0x9932cc,
                         "dark_red"            => 0x8b0000,
                         "dark_salmon"         => 0xe9967a,
                         "dark_sea_green"      => 0x8fbc8f,
                         "dark_slate_blue"     => 0x483d8b,
                         "dark_slate_gray"     => 0x2f4f4f,
                         "dark_turquoise"      => 0x00ced1,
                         "dark_violet"         => 0x9400d3,
                         "deep_pink"           => 0xff1493,
                         "deep_sky_blue"       => 0x00bfff,
                         "dim_gray"            => 0x696969,
                         "dodger_blue"         => 0x1e90ff,
                         "firebrick"           => 0xb22222,
                         "floral_white"        => 0xfffaf0,
                         "forest_green"        => 0x228b22,
                         "fuchsia"             => 0xff00ff,
                         "gainsboro"           => 0xdcdcdc,
                         "ghost_white"         => 0xf8f8ff,
                         "gold"                => 0xffd700,
                         "goldenrod"           => 0xdaa520,
                         "gray"                => 0xbebebe,
                         "green"               => 0x008000,
                         "green_yellow"        => 0xadff2f,
                         "honeydew"            => 0xf0fff0,
                         "hot_pink"            => 0xff69b4,
                         "indian_red"          => 0xcd5c5c,
                         "indigo"              => 0x4b0082,
                         "ivory"               => 0xfffff0,
                         "khaki"               => 0xf0e68c,
                         "lavender"            => 0xe6e6fa,
                         "lavender_blush"      => 0xfff0f5,
                         "lawn_green"          => 0x7cfc00,
                         "lemon_chiffon"       => 0xfffacd,
                         "light_blue"          => 0xadd8e6,
                         "light_coral"         => 0xf08080,
                         "light_cyan"          => 0xe0ffff,
                         "light_goldenrod"     => 0xfafad2,
                         "light_gray"          => 0xd3d3d3,
                         "light_green"         => 0x90ee90,
                         "light_pink"          => 0xffb6c1,
                         "light_salmon"        => 0xffa07a,
                         "light_sea_green"     => 0x20b2aa,
                         "light_sky_blue"      => 0x87cefa,
                         "light_slate_gray"    => 0x778899,
                         "light_steel_blue"    => 0xb0c4de,
                         "light_yellow"        => 0xffffe0,
                         "lime"                => 0x00ff00,
                         "lime_green"          => 0x32cd32,
                         "linen"               => 0xfaf0e6,
                         "magenta"             => 0xff00ff,
                         "maroon"              => 0xb03060,
                         "medium_aquamarine"   => 0x66cdaa,
                         "medium_blue"         => 0x0000cd,
                         "medium_orchid"       => 0xba55d3,
                         "medium_purple"       => 0x9370db,
                         "medium_sea_green"    => 0x3cb371,
                         "medium_slate_blue"   => 0x7b68ee,
                         "medium_spring_green" => 0x00fa9a,
                         "medium_turquoise"    => 0x48d1cc,
                         "medium_violet_red"   => 0xc71585,
                         "midnight_blue"       => 0x191970,
                         "mint_cream"          => 0xf5fffa,
                         "misty_rose"          => 0xffe4e1,
                         "moccasin"            => 0xffe4b5,
                         "navajo_white"        => 0xffdead,
                         "navy"                => 0x000080,
                         "old_lace"            => 0xfdf5e6,
                         "olive"               => 0x808000,
                         "olive_drab"          => 0x6b8e23,
                         "orange"              => 0xffa500,
                         "orange_red"          => 0xff4500,
                         "orchid"              => 0xda70d6,
                         "pale_goldenrod"      => 0xeee8aa,
                         "pale_green"          => 0x98fb98,
                         "pale_turquoise"      => 0xafeeee,
                         "pale_violet_red"     => 0xdb7093,
                         "papaya_whip"         => 0xffefd5,
                         "peach_puff"          => 0xffdab9,
                         "peru"                => 0xcd853f,
                         "pink"                => 0xffc0cb,
                         "plum"                => 0xdda0dd,
                         "powder_blue"         => 0xb0e0e6,
                         "purple"              => 0xa020f0,
                         "red"                 => 0xff0000,
                         "rosy_brown"          => 0xbc8f8f,
                         "royal_blue"          => 0x4169e1,
                         "saddle_brown"        => 0x8b4513,
                         "salmon"              => 0xfa8072,
                         "sandy_brown"         => 0xf4a460,
                         "sea_green"           => 0x2e8b57,
                         "seashell"            => 0xfff5ee,
                         "sienna"              => 0xa0522d,
                         "sky_blue"            => 0x87ceeb,
                         "slate_blue"          => 0x6a5acd,
                         "slate_gray"          => 0x708090,
                         "snow"                => 0xfffafa,
                         "spring_green"        => 0x00ff7f,
                         "steel_blue"          => 0x4682b4,
                         "tan"                 => 0xd2b48c,
                         "teal"                => 0x008080,
                         "thistle"             => 0xd8bfd8,
                         "tomato"              => 0xff6347,
                         "turquoise"           => 0x40e0d0,
                         "violet"              => 0xee82ee,
                         "wheat"               => 0xf5deb3,
                         "white"               => 0xffffff,
                         "white_smoke"         => 0xf5f5f5,
                         "yellow"              => 0xffff00  }

    # Creates a new color with the hex color provided as a number (i.e. 0x112233)
    def initialize(color=0x000000)
      string = "%.6x" % color
      @r = string[0..1].hex
      @g = string[2..3].hex
      @b = string[4..5].hex
    end
    
    # Initialize a color based on RGB values. By default, the values
    # should be between 0 and 255. If you use the option <tt>:percent => true</tt>,
    # the values should then be between 0.0 and 1.0.
    def self.from_rgb(r,g,b,options={})
      color = Colorist::Color.new
      # convert from 0.0 to 1.0 to 0 to 255 if the :percent option is used
      if options[:percent]
        color.r, color.g, color.b = r * 255, g * 255, b * 255
      else
        color.r, color.g, color.b = r, g, b
      end
      color
    end
    
    # Initialize a colour based on HSV/HSB values. Hue should be between 0 and 360 (inclusive),
    # while saturation and value should be from 0.0 to 1.0.
    def self.from_hsv(hue, saturation, value)
      saturation = 1 if saturation > 1
      value = 1 if saturation > 1
      
      # Conversion formula taken from wikipedia
      
      f = (hue / 60.0) - (hue / 60)
      
      p = value * (1 - saturation)
      q = value * (1 - (saturation * f))
      t = value * (1 - (saturation * (1 - f)))
      
      case ((hue / 60) % 6).floor
        when 0 then from_rgb(value, t, p, :percent => true)
        when 1 then from_rgb(q, value, p, :percent => true)
        when 2 then from_rgb(p, value, t, :percent => true)
        when 3 then from_rgb(p, q, value, :percent => true)
        when 4 then from_rgb(t, p, value, :percent => true)
        when 5 then from_rgb(value, p, q, :percent => true)
      end
    end
        
    # Converts a W3C hex string into a color. Works both with the
    # full form (i.e. <tt>#ffffff</tt>) and the abbreviated form (<tt>#fff</tt>). Can
    # also take any of the 16 named W3C colors.
    # Specify a standard if you enter the key word as defined by the standard you use, the 
    # available standards are :
    #
    # * <tt>:w3c</tt> - Used by default, represent W3C colors specified in W3C_COLOR_NAMES constant
    # * <tt>:x11</tt> - represent X11 standard colors specified in X11_COLOR_NAMES constant
    #
    # Examples :
    #  
    #  # Here we can ommit standard parameter (:w3c by default) 
    #  color = Colorist::Color.from_string "gray" # => <Color #808080>
    #
    #  # For X11 standard (gray hex value is different)
    #  color = Colorist::Color.from_string "gray", :x11 # => <Color #BEBEBE>
    #
    #  # Other X11 color (case insensitive)
    #  color = Colorist::Color.from_string "Dark Olive Green", :x11 # => <Color #556B2F>
    def self.from_string(some_string, standard=:w3c)
      some_string = some_string.downcase.sub(/ /, "_")
      if matched = some_string.match(/\A#([0-9a-f]{3})\z/i)
        color = Colorist::Color.from_rgb(*matched[1].split(//).collect{|v| "#{v}#{v}".hex })
      elsif matched = some_string.match(/\A#([0-9a-f]{6})\z/i)
        color = Colorist::Color.new
        color.r = matched[1][0..1].hex
        color.g = matched[1][2..3].hex
        color.b = matched[1][4..5].hex
      elsif standard == :w3c
        if W3C_COLOR_NAMES.key?(some_string)
          color = Colorist::Color.new(W3C_COLOR_NAMES[some_string])
        else
          raise ArgumentError, "#{some_string} is not a valid W3C color.", caller
        end
      elsif standard == :x11
        if X11_COLOR_NAMES.key?(some_string)
          color = Colorist::Color.new(X11_COLOR_NAMES[some_string])
        else
          raise ArgumentError, "#{some_string} is not a valid X11 color.", caller
        end
      else
        raise ArgumentError, "Must provide a valid W3C or X11 hex color or color name.", caller
      end
      color
    end
    
    # Create a new color from the provided object. Duplicates Color objects
    # and attempts to call <tt>to_color</tt> on other objects. Will raise
    # an ArgumentError if it is unable to coerce the color.
    def self.from(some_entity)
      case some_entity
        when Colorist::Color
          some_entity.dup
        else
          raise ArgumentError, "#{some_entity.class.to_s} cannot be coerced into a color.", caller unless some_entity.respond_to?(:to_color)
          some_entity.to_color
      end
    end
  
    # Create a duplicate of this color.
    def dup
      Colorist::Color.from_rgb(@r,@g,@b)
    end
  
    # Add the individual RGB values of two colors together. You
    # may also use an equivalent numeric or string color representation.
    #
    # Examples:
    #
    #   gray = Colorist::Color.new(0x333333)
    #   gray + "#300"   # => <Color #663333>
    #   gray + 0x000000 # => <Color #333333>
    #   white = "white".to_color
    #   gray + white    # => <Color #ffffff>
    def +(other_color)
      other_color = Colorist::Color.from(other_color)
      color = self.dup
      color.r += other_color.r
      color.g += other_color.g
      color.b += other_color.b
      color
    end
  
    # Subtract the individual RGB values of the two colors together.
    # You may also use an equivalent numeric or string color representation.
    def -(other_color)
      other_color = Colorist::Color.from(other_color)
      color = self.dup
      color.r -= other_color.r
      color.g -= other_color.g
      color.b -= other_color.b
      color
    end
    
    # Compares colors based on brightness.
    def <=>(other_color)
      other_color = Colorist::Color.from(other_color)
      brightness <=> other_color.brightness
    end
    
    # Compares colors based on brightness.
    def < (other_color)
      other_color = Colorist::Color.from(other_color)
      brightness < other_color.brightness
    end
    
    # Compares colors based on brightness.
    def > (other_color)
      other_color = Colorist::Color.from(other_color)
      brightness > other_color.brightness
    end
    
    # Equal if the red, green, and blue values are identical.
    def ==(other_color)
      other_color = Colorist::Color.from(other_color)
      other_color.r == self.r && other_color.g == self.g && other_color.b == self.b
    end
    
    # Equal if the brightnesses of the two colors are identical.
    def ===(other_color)
      other_color = Colorist::Color.from(other_color)
      other_color.brightness == brightness
    end
    
    def r=(value) #:nodoc:
      @r = value; normalize; end 
    def g=(value) #:nodoc:
      @g = value; normalize; end
    def b=(value) #:nodoc:
      @b = value; normalize; end
  
    # Outputs a string representation of the color in the desired format.
    # The available formats are:
    #
    # * <tt>:css</tt> - As a CSS hex string (i.e. <tt>#ffffff</tt>) (default)
    # * <tt>:css_rgb</tt> - As a CSS RGB value string (i.e. <tt>rgb(255,255,255)</tt>)
    # * <tt>:rgb</tt> - As an RGB triplet (i.e. <tt>1.0, 1.0, 1.0</tt>)
    def to_s(format=:css)
      case format
        when :css
          "#%.2x%.2x%.2x" % [r, g, b]
        when :css_rgb
          "rgb(%.2f,%.2f,%.2f)" % [r, g, b]
        when :rgb
          "%.3f, %.3f, %.3f" % [r / 255, g / 255, b / 255]
      end
    end
    
    # Returns an array of the hue, saturation and value of the color.
    # Hue will range from 0-359, hue and saturation will be between 0 and 1.

    def to_hsv
      red, green, blue = *[r, g, b].collect {|x| x / 255.0}
      max = [red, green, blue].max
      min = [red, green, blue].min

      if min == max
        hue = 0
      elsif max == red
        hue = 60 * ((green - blue) / (max - min))
      elsif max == green
        hue = 60 * ((blue - red) / (max - min)) + 120
      elsif max == blue
        hue = 60 * ((red - green) / (max - min)) + 240
      end

      saturation = (max == 0) ? 0 : (max - min) / max
      [hue % 360, saturation, max]
    end
  
    def inspect
      "#<Color #{to_s(:css)}>"
    end
  
    # Returns the perceived brightness of the provided color on a
    # scale of 0.0 to 1.0 based on the formula provided. The formulas
    # available are:
    #
    # * <tt>:w3c</tt> - <tt>((r * 299 + g * 587 + b * 114) / 1000 / 255</tt>    
    # * <tt>:standard</tt> - <tt>sqrt(0.241 * r^2 + 0.691 * g^2 + 0.068 * b^2) / 255</tt>
    def brightness(formula=:w3c)
      case formula
        when :standard
          Math.sqrt(0.241 * r**2 + 0.691 * g**2 + 0.068 * b**2) / 255
        when :w3c
          ((r * 299 + g * 587 + b * 114) / 255000.0)
      end
    end
    
    # Contrast this color with another color using the provided formula. The
    # available formulas are:
    #
    # * <tt>:w3c</tt> - <tt>(max(r1 r2) - min(r1 r2)) + (max(g1 g2) - min(g1 g2)) + (max(b1 b2) - min(b1 b2))</tt>
    def contrast_with(other_color, formula=:w3c)
      other_color = Color.from(other_color)
      case formula
        when :w3c
          (([self.r, other_color.r].max - [self.r, other_color.r].min) +
          ([self.g, other_color.g].max - [self.g, other_color.g].min) +
          ([self.b, other_color.b].max - [self.b, other_color.b].min)) / 765.0
      end
    end
    
    # Returns the opposite of the current color.
    def invert
      Color.from_rgb(255 - r, 255 - g, 255 - b)
    end
        
    # Uses a naive formula to generate a gradient between this color and the given color.
    # Returns the array of colors that make the gradient, including this color and the
    # target color.  By default will return 10 colors, but this can be changed by supplying
    # an optional steps parameter.
    def gradient_to(color, steps = 10)
      color_to = Colorist::Color.from(color)
      red = color_to.r - r
      green = color_to.g - g
      blue = color_to.b - b
            
      result = (1..(steps - 3)).to_a.collect do |step|
        percentage = step.to_f / (steps - 1)
        Color.from_rgb(r + (red * percentage), g + (green * percentage), b + (blue * percentage))
      end
      
      # Add first and last colors to result, avoiding uneccessary calculation and rounding errors
      
      result.unshift(self.dup)
      result.push(color.dup)
      result
    end
    
    # Converts the current color to grayscale using the brightness
    # formula provided. See #brightness for a description of the 
    # available formulas.
    def to_grayscale(formula=:w3c)
      b = brightness(formula)
      Color.from_rgb(255 * b, 255 * b, 255 * b)
    end
  
    # Returns an appropriate text color (either black or white) based on
    # the brightness of this color. The +threshold+ specifies the brightness
    # cutoff point.
    def text_color(threshold=0.6, formula=:standard)
      brightness(formula) > threshold ? Colorist::Color.new(0x000000) : Colorist::Color.new(0xffffff)
    end
  
    protected
  
    def normalize #:nodoc:
      @r = 255 if @r > 255
      @g = 255 if @g > 255
      @b = 255 if @b > 255
      @r = 0 if @r < 0
      @g = 0 if @g < 0
      @b = 0 if @b < 0
    end
  end
end