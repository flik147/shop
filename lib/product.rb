class Product
  attr_reader :price, :amount
  def initialize(params)
    @title = params[:title]
    @author = params[:author]
    @price = params[:price]
    @amount = params[:amount]
  end

  def self.create_by_file(file_path)
    raise NotImplementedError
  end

  def update(params)
    @title = params[:title]
    @author = params[:author]
    @price = params[:price]
    @amount = params[:amount]
  end
end