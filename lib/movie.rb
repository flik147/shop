class Movie < Product
  def initialize(params)
    super

    @year = params[:year]
  end

  def to_s
    "Фильм: #{@title} режиссер - #{@author}, год выхода: #{@year}, цена: #{@price}, осталось: #{@amount}"
  end
end