require_relative '../src/genre'
require_relative '../src/item'
describe Genre do
  context 'when testing genre class mthods' do
    name = 'rock'
    genre = Genre.new(name)
  
    it 'returns name instance of the genre class ' do
      expect(genre.name).to equal(name)
    end
  end
end
