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
    end
  end

  def list_all_labels
    @labels = load_labels
    if @labels.empty?
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
    @labels << { title: title, color: color }
    save_labels(@labels)
    puts 'Label created successfully!'
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
    book = Book.new(title, cover_state, publisher, publish_date)
    @books << { title: title, cover: cover_state, publisher: publisher, publish_date: publish_date }
    puts 'Book added successfully!'
    save_book(@books)
    puts 'Would you like to create label? [1] = Yes & [2] = No'
    option = gets.chomp.to_i
    case option 
    when 1
      create_label
    when 2
      puts 'Thank you!'
    else
      puts 'Invalid entry, try again!'
    end
  end
end
