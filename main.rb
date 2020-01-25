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
require_relative 'lib/disk'
require_relative 'lib/cart'
require_relative 'lib/product_collection'

product_collection = ProductCollection.create_from_dir(File.dirname(__FILE__) + '/data')
user_cart = Cart.new()

product_sort = {by: :price, order: :asc}

product_collection.sort!(product_sort)

loop do
  puts "Что вы хотите купить?"

  puts product_collection.to_s
  puts "0. Выход"

  user_input = STDIN.gets.to_i

  break if user_input == 0

  if (1..product_collection.to_a.size).include?(user_input)
    chosen_product = product_collection.to_a[user_input-1]

    puts

    if chosen_product&.amount&.positive?
      puts "Вы выбрали #{chosen_product}"

      user_cart.add_to_cart(chosen_product)
      chosen_product.amount -= 1
    else
      puts "Товар закончился"
    end
  else
    puts "Нет такого товара"
  end

  puts
  puts "Ваша корзина:"
  puts  user_cart.to_a
  puts "Всего на сумму: #{user_cart.calculate_total_price} руб."
  puts
end

if user_cart.to_a.empty?
  puts "Приходите еще"
else
  puts "Вы купили:"
  puts  user_cart.to_a
  puts "С вас #{user_cart.calculate_total_price} руб. Спасибо за покупки"
end
