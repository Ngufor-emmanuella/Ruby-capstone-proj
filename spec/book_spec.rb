require_relative '../book'
require_relative '../label'
require_relative '../src/item'
require_relative 'spec_helper'

describe 'Test the book class' do 
  book = Book.new('Book1', 'Penguin', 'Good', '2020-05-23')

  it 'returns the right book publisher' do
    expect(book.publisher).to eql 'Penguin'
  end

  it 'returns the correct publish date' do 
    expect(book.publish_date).to eql '2020-05-23'
  end

  it 'returns the cover state' do
    expect(book.cover_state).to eql 'Good'
  end
end