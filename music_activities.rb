require 'json'
require './data'
require './src/music'
require './src/genre'

class MusicActivities
  include Data
  def initialize
    @music = load_music
    @genres = load_genres
  end

  def list_all_music
    @music = load_music
    if @music.empty?
      puts 'No album records found!'
    else
      @music.each_with_index do |music, index|
        puts "(#{index}) Album: #{music['publish_date']}, on_spotify: #{music['on_spotify']}"
      end
    end
  end

  def list_all_genres
    @genres = load_genres
    if @genres.empty?
      puts 'No genre records found!'
    else
      @genres.each do |genre|
        puts "Genre: #{genre}"
      end
    end
  end

  def add_genre
    print 'Add genre name: '
    genre_name = gets.chomp
    Genre.new(genre_name)
    @genres << genre_name
    save_genres(@genres)
    puts 'Genre added successfully!'
  end

  def add_music_album
    print 'Is the music album on Spotify? [Y/N]: '
    on_spotify = gets.chomp.upcase == 'y'
    puts 'Enter date published: '
    date = gets.chomp
    publish_date = validate_date(date)
    Music.new(publish_date, on_spotify)
    @music << { publish_date: publish_date, on_spotify: on_spotify }
    puts 'Music album added successfully!'
    save_music(@music)
    puts 'Would you like to add genre? [1] = Yes & [2] = No'
    option = gets.chomp.to_i
    case option
    when 1
      add_genre
    when 2
      puts 'Thank you!'
    end
  end

  def validate_date(date)
    format = '%Y-%m-%d'
    DateTime.strptime(date, format)
    date
  rescue ArgumentError
    puts 'Invalid date. Required format [YYYY-MM-DD]'
    print 'Try again: '
    date = gets.chomp
    validate_date(date)
  end
end
