class Disk < Product
  def initialize(params)
    super

    @genre = params[:genre]
    @year = params[:year]
  end

  def self.create_by_file(file_path)
    f = File.readlines(file_path, encoding: 'UTF-8', chomp: true)

    self.new(
      title: f[0],
      author: f[1],
      genre: f[2],
      year: f[3].to_i,
      price: f[4].to_i,
      amount: f[5].to_i
    )
  end

  def update(params)
    super

    @genre = params[:genre]
    @year = params[:year]
  end

  def to_s
    "Альбом: \"#{@title}\", исполнитель: #{@author}, жанр: #{@genre}, год выхода: #{@year}, цена: #{@price}P, осталось: #{@amount}"
  end
end
