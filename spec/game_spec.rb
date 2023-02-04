require './src/item'
require './src/game'

describe Game do
  before :all do
    @game = Game.new(true, '12/12/2012', '01/01/2002')
    @item = Item.new('12/12/2001')
  end

  context '#initialize' do
    it 'takes 2 parameters and return an instance of Game' do
      expect(@game).to be_instance_of Game
    end
  end

  context '#moved_to_archive?' do
    it 'returns true if can_be_archived? is true' do
      expect(@item.move_to_archive).to be true
    end
  end
end
