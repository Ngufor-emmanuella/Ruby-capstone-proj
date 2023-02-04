class MusicActivities
  def initialize
    @music_albums = []
    @genres = []
  end

  def add_genre(item)
    puts 'Enter genre name: '
    name = gets.chomp
    genre = Genre.new(name)
    genre.add_item(item)
    @genres.push(genre)
    store_genre
    puts 'Genre added successfully!'
  end

  def add_music_album
    puts 'Is the music on spotify? (Y/N): '
    on_spotify = gets.chomp.downcase == 'y'
    puts 'Enter publish date (YYYY-MM-DD): '
    publish_date = gets.chomp
    music = Music.new(publish_date: publish_date, on_spotify: on_spotify)
    add_genre(music)
    @music_albums.push(music)
    store_album
    puts 'Music album added successfully!'
  end
end
