require_relative '../music'
require_relative '../item'
require 'rspec'

RSpec.describe Music do
  describe '#initialize' do
    it 'initialize on_spotify' do
      music = Music.new(false, '2022-03-01')
      expect(music.on_spotify).to eq(false)
    end
  end

  describe 'can be archive method' do
    it 'can archive the album of music' do
      music = Music.new(true, '2011-03-04')
      result = music.send(:can_be_archived?)
      expect(result).to eq(true)
    end
  end
end
