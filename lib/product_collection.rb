class ProductCollection
  #attr_reader :products
  PRODUCT_TYPES = {
    film: {dir: 'movies', class: Movie},
    book: {dir: 'books', class: Book}
  }

  def initialize(products = [])
    @products = products
  end

  def self.create_from_dir(dir)
    #puts "#{dir}"
    products = []

    PRODUCT_TYPES.each do |types, hash|
      product_dir = hash[:dir]
      product_class = hash[:class]

      Dir[dir + '/' + product_dir + '/*.txt'].each do |path|
        #puts "#{path}"
        #puts "#{product_class}"
        products << product_class.create_by_file(path)
      end

    end
    puts products
    self.new(products)
  end

  def to_a
    @products
  end

end