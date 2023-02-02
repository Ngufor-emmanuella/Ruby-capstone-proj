require_relative '../src/genre'
require_relative '../src/item'
require 'rspec'

describe Genre do
  describe 'class' do
    it 'creates a new object of Genre name' do
      genre = Genre.new('emma')
      expect(genre.name).to eq('emma')
    end

    it 'crreates a new object of Genre name' do
      genre = Genre.new('emma')
      expect(genre.items).to eq([])
    end

    it 'generates random id' do
      genre = Genre.new('emma')
      allow(genre).to recieve(:rand).and_return(5)
      result = genre.send(:generate_id)
      expect(result).to eq(5)
    end

    it 'adds random items' do
      item = Item.new('archived', DateTime.now.to_s)
      genre = Genre.new('cesar', id: 10)
      genre.add_item(item)
      expect(genre.items).to include(item)
    end
  end
end
