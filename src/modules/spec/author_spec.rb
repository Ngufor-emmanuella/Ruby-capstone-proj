require './src/author'
require './src/item'

describe Author do
  before :all do
    @author = Author.new('John', 'Doe')
  end

  context '#initialize' do
    it 'takes 2 parameters and return an instance of Author' do
      expect(@author).to be_instance_of Author
    end
  end

  context '#add_item' do
    it 'adds an item to the items array' do
      @item = Item.new('01-05-1990')
      @author.add_item(@item)
      expect(@author.items.length).to eq 1
    end

    it 'adds another item to the items array' do
      @item = Item.new('12-02-1989')
      @author.add_item(@item)
      expect(@author.items.length).to eq 2
    end
  end
end
