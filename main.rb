if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

require_relative 'lib/product'
require_relative 'lib/movie'
require_relative 'lib/book'
require_relative 'lib/product_collection'

product_collection = ProductCollection.create_from_dir(File.dirname(__FILE__) + '/data')

product_collection.to_a #здесь не работает

#book = Book.create_by_file("D:/rubytut2/lesson6/shop/data/books/01.txt")
#movie = Movie.create_by_file("D:/rubytut2/lesson6/shop/data/movies/03.txt")

#puts book.to_s
#puts movie.to_s