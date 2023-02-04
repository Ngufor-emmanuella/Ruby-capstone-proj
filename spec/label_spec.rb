require_relative '../book'
require_relative '../label'
require_relative '../src/item'
require_relative 'spec_helper'

describe 'Test the label class' do
  label = Label.new('Thriller', 'Grey')

  it 'returns the right title of the label' do
    expect(label.title).to eql('Thriller')
  end

  it 'returns the right color of label' do
    expect(label.color).to eql('Grey')
  end
end
