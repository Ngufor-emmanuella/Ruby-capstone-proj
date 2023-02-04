class Genre
  attr_reader :name

  def initialize(name)
    @id = rand(100...1000)
    @name = name
    @items = []
  end

  def add_item(item)
    @items.push(item)
    item.genre = self
  end
end
