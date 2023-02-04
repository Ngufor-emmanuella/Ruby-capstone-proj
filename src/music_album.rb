require_relative './item'

class Music_Album < Item
  attr_reader :id
  attr_accessor :on_spotify

  def initialize(on_spotify, published_date, archived: false, id: nil)
    super(id, published_date, archived)
    @on_spotify = on_spotify
  end

  private

  def can_be_archived?
    super && @on_spotify == true
  end

  private :can_be_archived?
end
