require_relative '../game'
require_relative '../author'
require 'json'

class GameAuthor
  attr_accessor :games, :authors

  def initialize
    @games = load_games
    @authors = load_authors
  end

  def add_game
    is_multiplayer = true

    puts 'Add a new game'

    print 'Last played on? [yyyy-mm-dd]: '
    date = gets.chomp
    last_played = validate_date(date)

    print 'Pushlished on? [yyyy-mm-dd]: '
    date2 = gets.chomp
    publish_date = validate_date(date2)

    add_author

    print 'Is the game a Multiplayer? [Y/N]: '
    multiplayer = gets.chomp.downcase

    case multiplayer
    when 'y' then is_multiplayer
    when 'n' then is_multiplayer = false
    else
      puts 'Invalid option. Game not added.'
    end

    new_game = Game.new(is_multiplayer, last_played, publish_date)
    @games << new_game
    puts 'Game added successfully'
  end

  # Define game author
  def add_author
    puts 'Add author Details. '
    puts ''
    print 'Add first name: '
    author_first = gets.chomp

    print 'Add second name: '
    author_second = gets.chomp

    new_author = Author.new(author_first, author_second)
    @authors << new_author
  end

  # Validate user dates
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

  # List games
  def list_games
    if @games.empty?
      puts 'No games available!'
    else
      puts 'List of available games.'
      puts ''
      @games.each do |game|
        puts "#{[game.class]} Multiplayer: #{game.multiplayer} Last Played:
        #{game.last_played_at} Pushlish Date: #{game.publish_date}"
      end
    end
  end

  # List authors
  def list_authors
    if @authors.empty?
      puts 'No authors available!'
    else
      puts 'List of authors'
      puts ''
      @authors.each do |author|
        puts "#{author.first_name} #{author.last_name}"
      end
    end
  end

  # Save games
  def save_games
    return if @games.empty?

    games_json = @games.map(&:as_json)
    File.write('./src/riz/games.json', JSON.dump(games_json))
  end

  def load_games
    return [] unless File.exist?('./src/riz/games.json')

    new_game_arr = []

    games = JSON.parse(File.read('./src/riz/games.json'))
    games.each do |game|
      new_game = Game.new(game['multiplayer'], game['last_played_at'],
                          game['publish_date'])
      new_game_arr << new_game
    end
    new_game_arr
  end

  # Save author
  def save_authors
    return if @authors.empty?

    authors_json = @authors.map(&:as_json)
    File.write('./src/riz/authors.json', JSON.dump(authors_json))
  end

  # Load games
  def load_authors
    return [] unless File.exist?('./src/riz/authors.json')

    new_author_arr = []
    authors = JSON.parse(File.read('./src/riz/authors.json'))
    authors.each do |author|
      new_author = Author.new(author['first_name'], author['last_name'])
      new_author_arr << new_author
    end
    new_author_arr
  end
end