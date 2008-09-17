module Colorist
  # Color is the general class for storing and manipulating a color with the
  # Colorist gem. It provides methods to add, subtract, and calculate aspects
  # of the color based on W3C and other standards.
  class Color            
    attr_accessor :r, :g, :b
  
    CSS_COLOR_NAMES = {  "maroon"  => 0x800000,
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
      end
      color.r, color.g, color.b = r, g, b
      color
    end
    
    # Converts a CSS hex string into a color. Works both with the
    # full form (i.e. <tt>#ffffff</tt>) and the abbreviated form (<tt>#fff</tt>). Can
    # also take any of the 16 named CSS colors.
    def self.from_string(some_string)
      if matched = some_string.match(/\A#([0-9a-f]{3})\z/i)
        color = Colorist::Color.from_rgb(*matched[1].split(//).collect{|v| "#{v}#{v}".hex })
      elsif matched = some_string.match(/\A#([0-9a-f]{6})\z/i)
        color = Colorist::Color.new
        color.r = matched[1][0..1].hex
        color.g = matched[1][2..3].hex
        color.b = matched[1][4..5].hex
      elsif CSS_COLOR_NAMES.key?(some_string)
        color = Colorist::Color.new(CSS_COLOR_NAMES[some_string])
      else
        raise ArgumentError, "Must provide a valid CSS hex color or color name.", caller
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