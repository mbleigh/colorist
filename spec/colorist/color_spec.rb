require 'spec_helper'
require 'colorist'

describe Colorist::Color do
	
	before :each do
		@color = Colorist::Color.new 0x808080
  end
	
	describe "#1 Color" do
		
		it "should initialize default color (#000000)" do
			Colorist::Color.new.to_s.should == "#000000"
		end

		it "should initialize the approriate color" do
			hex_color = 0x112233
			Colorist::Color.new(hex_color).to_s.should == "#112233"
		end
		
		it "should normalize rgb value on modification" do
			color = Colorist::Color.from("#ff2233")
			color.r, color.g, color.b = 22, 256, -3
			color.to_s.should == "#16ff00"
		end
		
		it "should convert ruby object to Color instance" do
			"#808080".to_color.should == @color
		end
		
		it "should duplicate the color (rgb values)" do
			color = @color.dup
			[color.r, color.g, color.b].should === [@color.r, @color.g, @color.b]
		end
		
	end 
	
	describe "#2 From entity" do
		
		it "should return the color from css string (#121212)" do
			Colorist::Color.from_string("#121212").to_s.should == "#121212"
		end

		it "should return the W3C gray color from word (#bebebe)" do
			Colorist::Color.from_string("gray", :w3c).to_s.should == "#808080"
		end

		it "should return the X11 gray color from word (#808080)" do
			Colorist::Color.from_string("gray", :x11).to_s.should == "#bebebe"
		end
		
		it "should return color from rgb" do 
			Colorist::Color.from_rgb(24, 230, 36).to_s.should == "#18e624"
		end
		
		it "should return color from rgb with percent values" do
			Colorist::Color.from_rgb(0.15, 1, 0.2, :percent => true).to_s.should == "#26ff33"
		end
		
		it "should return color from hsv" do
			Colorist::Color.from_hsv(0, 0.0, 0.5019607843137255).to_s.should == @color.to_s
		end
		
	end
	
	describe "#3 Operations" do
		
		it "should be equal to the other color" do
			@color.should == Colorist::Color.from_string("gray")
		end
		
	end
	
	describe "#4 Format" do
		
		it "should convert to css string" do
			@color.to_s(:css).should == "#808080"
		end
		
		it "should convert to rgb in css style" do
			@color.to_s(:css_rgb).should == "rgb(128.00,128.00,128.00)"
		end
		
		it "should convert to rgb triplet" do
			@color.to_s(:rgb).should == "0.000, 0.000, 0.000"
		end
		
		it "should convert to hsv" do
			@color.to_hsv.should == [0, 0.0, 0.5019607843137255]
		end
		
	end
	
end