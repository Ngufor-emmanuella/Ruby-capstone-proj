require_relative './music_album'

class Music_detail < Music_album
  @music_albums = []
  attr_reader :title, :artist

  def initialize(title, artist, genre, on_spotify, publish_date)
    super(publish_date, on_spotify)
    @title = title
    @artist = artist
    @genre = genre

    @@music_albums << self
  end

  def self.list_music_albums
    @@music_albums
  end
end
