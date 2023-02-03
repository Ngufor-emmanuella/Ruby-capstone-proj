require 'json'
require './book'
require './label'
require './data'

class BookActivities
  include Data
  def initialize
    @books = load_books 
    @labels = load_labels
  end

  def list_all_books
    @books = load_books
    if @books.empty?
      puts 'NO BOOK RECORDS FOUND!'
    else
      @books.each_with_index do |book, index|
        puts "(#{index}) Title: #{book['title']}, Publisher: #{book['publisher']}, Date published: #{book['publish_date']}"
      end
      puts
    end
  end

  def list_all_labels
    @labels = load_labels
    if labels.empty?
      puts 'NO LABEL RECORDS FOUND!'
    else
      @labels.each_with_index do |label, index|
        puts "(#{index}) Title #{label['title']}, Color #{label['color']}"
      end
    end
  end

  def create_label
    print 'Add label title: '
    title = gets.chomp
    print 'Add label color: '
    color = gets.chomp
    label = Label.new(title, color)
    @labels.push(label)
    store_labels
    puts 'n\Label created successfully!'
  end

  def add_book
    print 'Enter book title: '
    title = gets.chomp
    print 'Enter book publisher: '
    publisher = gets.chomp
    print 'Enter date published: '
    publish_date = gets.chomp
    print 'Enter cover state (good/bad): '
    cover_state = gets.chomp
    book = Book.new(cover_state, publisher,  publish_date)
    @books < { title: title, cover: book.cover_state, publisher: publisher, publish_date: publish_date }
    #label = handle_label
    puts 'Would you like to create label? [1] = Yes & [2] = No'
    options = gets.chomp.to_i
    case options
    when '1' 
      create_label
      puts 'Book added sussessfully!'
    when '2'
      save_book(book)
    end
    save_book(book)
  end

  #   label.add_item(book)
  #   @labels << label unless @labels.include?(label)
  #   store_labels
  #   @books << book
  #   store_books
  #   puts 'Book added successfully'
  # end

  def handle_label
    return unless @labels.any?

    print 'Enter (1) to select label or (2) to craete a new label: '
    user_option = gets.chomp.to_i
    case user_option
    when '1'
      puts 'select a label from list by index: '
      list_all_labels
      user_option = gets.chomp
      @labels[user_option.to_i]
    when '2'
      create_label
    else
      print 'invalid entry'
    end
  end

  def store_books
    stored_books = Data.new('./books.json')
    books = stored_books.load
    @books.each do |book|
      books << { title: book.title, publisher: book.publisher, publish_date: book.publish_date, cover_state: book.cover_state }
    end
    stored_books.save(books)
  end

  def store_labels
    stored_labels = Data.new('./labels.json')
    labels = stored_labels.load
    @labels.each do |label|
      labels << { title: label.title, color: label.color }
    end
    stored_labels.save(labels)
  end
end
