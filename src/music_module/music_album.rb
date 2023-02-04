require_relative '../item'

class MusicAlbum < Item
  attr_reader :on_spotify

  def initialize(publish_date, on_spotify)
    super(publish_date)
    @on_spotify = on_spotify
  end

  private

  def can_be_archived?
    return true if move_to_archive && @on_spotify
  end
end
