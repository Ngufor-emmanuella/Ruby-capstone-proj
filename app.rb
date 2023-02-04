require './src/riz/game_author'
require_relative './src/music_module/app_methods'
require_relative './book_activities'
require_relative './music_activities'

class App
  # include PreserveArcade
  include AppMethods

  def initialize
    @game = GameAuthor.new
    @book = BookActivities.new
    @music = MusicActivities.new
  end

  def list_options
    op = "
    Please choose your desired option below:

    (1) List all books
    (2) List all music albums
    (3) List of games
    (4) List all genres
    (5) List all labels
    (6) List all authors
    (7) Add a book
    (8) Add a music album
    (9) Add a game
    (10) Quit"

    puts op
    puts '================================================'
  end

  def way_to_exit
    # preserve_arcade_data(@arcade)
    @game.save_authors
    @game.save_games

    puts 'Thank you for using the App, Goodbye!'
    puts
    exit
  end

  def first_choices(input)
    case input
    when 1
      @book.list_all_books
    when 2
      @music.list_all_music
    when 3
      @game.list_games
    end
  end

  def second_choices(input)
    case input
    when 4
      @music.list_all_genres
    when 5
      @book.list_all_labels
    when 6
      @game.list_authors
    end
  end

  def third_choices(input)
    case input
    when 7
      @book.add_book
    when 8
      @music.add_music_album
    when 9
      @game.add_game
    end
  end

  def choices
    list_options
    input = gets.chomp.to_i

    if input.positive? && input < 4
      first_choices(input)
    elsif input > 3 && input < 7
      second_choices(input)
    elsif input > 6 && input <= 9
      third_choices(input)
    else
      way_to_exit
    end
  end
end
