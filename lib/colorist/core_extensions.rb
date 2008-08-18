class Integer
  # Converts a hexadecimal number into a Color. Must be
  # the equivalent of the full hexadecimal form (for example,
  # <tt>0x123456</tt>).
  def to_color
    Colorist::Color.new(self)
  end
end

class Float
  # Converts a number from 0.0 to 1.0 to the grayscale equivalent
  # of that brightness value. Especially useful for adding percentages
  # to a color.
  def to_color
    Colorist::Color.from_rgb(self * 255, self * 255, self * 255)
  end
end

class String
  # Converts a CSS-style color string to a Color. Can be
  # in the full form (<tt>\#112233</tt>), the abbreviated form
  # (<tt>\#123</tt>) or a CSS named color (<tt>"black"</tt> or <tt>"maroon"</tt>).
  def to_color
    Colorist::Color.from_string(self)
  end
end