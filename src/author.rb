class Author
  attr_accessor :first_name, :last_name, :items_array

  def initialize(first_name, last_name)
    @id = Random.rand(1...1000)
    @first_name = first_name
    @last_name = last_name
    @items_array = []

    def add_item(item)
      @items_array << item
      item.author = self
    end
  end;