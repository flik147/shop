class Cart
  def initialize
    @cart_products = []
    @total_price = 0
  end

  def to_a
    @cart_products
  end

  def add_to_cart(product)
    @cart_products << product
  end

  def calculate_total_price
    @total_price = @cart_products.sum(&:price)
  end
end
