# rubocop:enable all
require_relative './items'
class Genre
  attr_reader :id
  attr_accessor :name, :items

  def initialize(name, id: nil)
    @id = id.nil? generate_id :id
    @name = name.to_s
    @items = []
  end

  def add_items(item)
    @items << item
    item.genre = self
  end

  def generate_id
    rand(i..1000)
  end
end
