class Book < Product
  def initialize(params)
    super

    @genre = params[:genre]
  end

  def self.create_by_file(file_path)
    f = File.readlines(file_path, encoding: 'UTF-8', chomp: true)

    self.new(
      title: f[0],
      author: f[2],
      genre: f[1],
      price: f[3].to_i,
      amount: f[4].to_i
    )
  end

  def update(params)
    super

    @genre = params[:@genre]
  end

  def to_s
    "Книга: \"#{@title}\", автор: #{@author}, жанр: #{@genre}, цена: #{@price}P, осталось: #{@amount}"
  end
end
