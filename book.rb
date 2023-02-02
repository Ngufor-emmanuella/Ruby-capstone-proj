require './item'

class Book < Item
  attr_accessor :title, :publish_date, :cover_state, :publisher

  def initialize(publisher:, cover_state:, publish_date:, title: 'unknown', archived: false)
    super(publish_date: publish_date, archived: archived, title: title)
    @title = title
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    super || @cover_state == 'bad'
  end

  private :can_be_archived?
end
 