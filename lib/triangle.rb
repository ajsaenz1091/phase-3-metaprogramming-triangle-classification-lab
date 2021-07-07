class Triangle
  # write code here
  attr_reader :side1, :side2, :side3

  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
  end

  def kind
    self.valid_triangle?
    if @side1 == @side2 && @side2 == @side3
      :equilateral
    elsif @side1 == @side2 || @side2 == @side3 || @side1 == @side3
      :isosceles
    else
      :scalene
    end
  end

  def valid_triangle?
    # The sum of the lengths of any two sides of a triangle always exceeds the length of the third side. This is a principle known as the triangle inequality.
    # Further, each side must be larger than 0.
    real_triangle = [(@side1 + @side2 > @side3),(@side2 + @side3 > @side2),(@side1 + @side3 > @side2)]
    [@side1 , @side2 , @side3].each do |side|
      real_triangle << false if side <= 0
    raise TriangleError if real_triangle.include?(false)
    end
  end

  class TriangleError < StandardError
    # triangle error code
    puts "This is an error for a bad triangle"
  end

end
