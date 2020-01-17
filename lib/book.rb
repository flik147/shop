class Book < Product
  def initialize(params)
    super

    @genre = params[:genre]
  end

  def update(params)
    super

    @genre = params[:@genre]
  end

  def to_s
    "Книга: #{@title} автор - #{@author}, жанр: #{@genre}, цена: #{@price}P , осталось: #{@amount}"
  end
end