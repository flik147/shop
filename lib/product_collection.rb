class ProductCollection
  #attr_reader :products
  PRODUCT_TYPES = {
    film: {dir: 'movies', class: Movie},
    disk: {dir: 'disks', class: Disk},
    book: {dir: 'books', class: Book}
  }

  def initialize(products = [])
    @products = products
  end

  def self.create_from_dir(dir)
    products = []

    PRODUCT_TYPES.each do |types, hash|
      product_dir = hash[:dir]
      product_class = hash[:class]

      Dir[dir + '/' + product_dir + '/*.txt'].each do |path|
        products << product_class.create_by_file(path)
      end

    end

    self.new(products)
  end

  def sort!(params)
    case params[:by]
    when :title
      @products.sort_by! {|product| product.to_s}
    when :price
      @products.sort_by! {|product| product.price}
    when :amount
      @products.sort_by! {|product| product.amount}
    end

    @products.reverse! if params[:order] == :asc

    self
  end

  def to_a
    @products
  end

  def to_s
    @products.map.with_index(1) {|item, index| "#{index}. #{item}"}.join("\n")
  end
end
