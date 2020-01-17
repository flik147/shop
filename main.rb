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

leon_movie = {
  title: "Леон",
  author: "Люк бессон",
  price: 990,
  amount: 4,
  year: 1994
}

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


leon = Movie.new(leon_movie)
fool = Movie.new(fool_movie)
idiot = Book.new(idiot_book)

puts leon.to_s
puts fool.to_s
puts idiot.to_



