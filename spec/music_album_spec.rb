require_relative '../music_album'
require_relative '../../item'

describe MusicAlbum do
  context '#initialize' do
    it('should test for on_spotify instance varaible') do
      music_album = MusicAlbum.new('10-01-2023', true)
      expect(music_album.on_spotify).to eql(true)
    end

    it('should test for publish date instance varaible') do
      music_album = MusicAlbum.new('10-01-2023', true)
      expect(music_album.publish_date).to eql('10-01-2023')
    end

    it('should test for archived instance varaible') do
      music_album = MusicAlbum.new('10-01-2023', true)
      expect(music_album.archived).to eql(false)
    end
  end

  context '#can_be_archived' do
    it('should return true if both can_be_archived and on_spotify is true') do
      item = Item.new('10-01-2000')
      music_album = MusicAlbum.new('11/01/2023', true)
      expect(item.move_to_archive && music_album.on_spotify).to be(true)
    end

    it('should return false if either can_be_archived and on_spotify is false') do
      new_item = Item.new('11-01-2023')
      expect(new_item.move_to_archive).to be(false)
    end
  end
end
