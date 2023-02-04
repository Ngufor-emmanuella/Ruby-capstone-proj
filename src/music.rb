require_relative './item'

class Music < Item
  attr_reader :id
  attr_accessor :on_spotify, :publish_date

  def initialize(on_spotify, published_date, archived: false, id: nil)
    super(published_date)
    @on_spotify = on_spotify
  end

  private

  def can_be_archived?
    super && @on_spotify == true
  end
end
