class CartesianProduct
  include Enumerable

  attr_accessor :a, :b

  def initialize(a, b)
    @a = a
    @b = b
  end

  def each
    @a.each do |xa|
        @b.each {|xb| yield([xa, xb])}
    end
  end
end


