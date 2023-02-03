require_relative './music_detail'
require_relative './genre'
require_relative '../modules/label'

module AppMethods
  def list_music_albums
    if MusicDetail.list_music_albums.empty?
      puts 'Oops! No available Album'
    else
      MusicDetail.list_music_albums.each_with_index do |album, index|
        puts "[#{index + 1}] #{album.title} by #{album.artist}"
      end
    end
  end

  def list_genres
    if Genre.all_genres.empty?
      puts 'Oops! No music found'
    else
      genres = []
      Genre.all_genres.each { |genre| genres << genre.name }
      puts genres.uniq
    end
  end

  def add_music_album
    print 'Enter Album name: '
    title = gets.chomp
    print 'Enter artist name: '
    artist = gets.chomp
    print 'Enter the publish date: '
    publish_date = gets.chomp

    print 'Enter genre: '
    genre = gets.chomp

    print 'Enter genre: '
    genre = gets.chomp
    print 'Is it on_spotify? [Y/N] '
    spotify = gets.chomp.downcase
    on_spotify = it_true(spotify)

    Genre.new(genre)
    MusicDetail.new(title, artist, genre, on_spotify, publish_date)
    puts 'Music Album Created Successfully'
  end

  private

  def it_true(bool)
    case bool
    when 'y'
      true
    when 'n'
      false
    end
  end
end
