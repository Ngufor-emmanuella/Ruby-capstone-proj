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
end
