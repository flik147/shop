class Movie < Product
  def initialize(params)
    super

    @year = params[:year]
  end

  def update(params)
    super

    @year = params[:year]
  end

  def to_s
    "Фильм: #{@title} режиссер - #{@author}, год выхода: #{@year}, цена: #{@price}P , осталось: #{@amount}"
  end
end