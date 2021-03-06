class Movie < Product
  def initialize(params)
    super

    @year = params[:year]
  end

  def self.create_by_file(file_path)
    f = File.readlines(file_path, encoding: 'UTF-8', chomp: true)
      #f.each { |f| puts "#{f}"}
    self.new(
      title: f[0],
      author: f[1],
      year: f[2].to_i,
      price: f[3].to_i,
      amount: f[4].to_i
    )
  end

  def update(params)
    super

    @year = params[:year]
  end

  def to_s
    "Фильм: \"#{@title}\", режиссер: #{@author}, год выхода: #{@year}, цена: #{@price}P, осталось: #{@amount}"
  end
end
