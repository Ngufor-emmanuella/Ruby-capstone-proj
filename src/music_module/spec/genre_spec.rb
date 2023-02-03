require_relative '../genre'
require_relative '../../item'

describe Genre do
  before(:all) do
    @genre = Genre.new('Gospel')
  end

  context '#initialize' do
    it('should test for instance variable') do
      expect(@genre.name).to eql('Gospel')
    end

    it('should return an array') do
      expect(@genre.items).to be_a Array
    end
  end

  context '#add_item' do
    it('should test for add_item method') do
      new_item = Item.new('01-02-1998')
      @genre.add_item(new_item)
      expect(new_item.genre).to eql @genre
    end

    it('should test for add_item method') do
      new_item = Item.new('22-12-2004')
      @genre.add_item(new_item)
      expect(@genre.items.length).to eql 2
    end
  end
end
