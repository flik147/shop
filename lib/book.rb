class Book < Product
  def initialize(params)
    super

    @genre = params[:genre]
  end

  def self.create_by_file(file_path)
    f = File.readlines(file_path, encoding: 'UTF-8', chomp: true)
    #f.each { |f| puts "#{f}"}
    self.new(title: f[0], author: f[2], genre: f[1], price: f[3], amount: f[4])
  end

  def update(params)
    super

    @genre = params[:@genre]
  end

  def to_s
    "Книга: #{@title} автор - #{@author}, жанр: #{@genre}, цена: #{@price}P , осталось: #{@amount}"
  end
end