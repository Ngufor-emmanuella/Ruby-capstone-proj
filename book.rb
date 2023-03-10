require './src/item'

class Book < Item
  attr_accessor :cover_state, :publisher

  def initialize(_title, publisher, cover_state, publish_date)
    super(publish_date)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    super || @cover_state == 'bad'
  end

  private :can_be_archived?
end
