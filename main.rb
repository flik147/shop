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

fool_movie = {
  title: "«Дурак»",
  author: "Юрий Быков",
  price: 390,
  amount: 1,
  year: 2014
}
idiot_book = {
  title: "Идиот",
  author: "Федор Достоевский",
  price: 390,
  amount: 7,
  genre: "роман"
}

idiot_book_update = {
  title: "Идиот",
  author: "Федор Достоевский",
  price: 10000,
  amount: 4,
  genre: "роман"
}



fool = Movie.new(fool_movie)
idiot = Book.new(idiot_book)
movie = Movie.create_by_file('./data/movies/01.txt')
book = Book.create_by_file('./data/books/01.txt')


idiot.update(idiot_book_update)


puts fool.to_s
puts book.to_s
puts movie.to_s
puts idiot.to_s




