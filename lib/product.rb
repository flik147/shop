class Product
  attr_reader :price, :amount
  attr_writer :price, :amount
  def initialize(params)
    @title = params[:title]
    @author = params[:author]
    @price = params[:price].to_i
    @amount = params[:amount].to_i
  end

  def self.create_by_file(file_path)
    raise NotImplementedError
  end

  def update(params)
    @title = params[:title]
    @author = params[:author]
    @price = params[:price].to_i if params[:price]
    @amount = params[:amount].to_i if params[:amount]
  end
end
