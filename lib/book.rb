class Book < Product
  def initialize(params)
    super

    @genre = params[:genre]
  end

  def to_s
    "Книга: #{@title} автор - #{@author}, жанр: #{@genre}, цена: #{@price}, осталось: #{@amount}"
  end
end