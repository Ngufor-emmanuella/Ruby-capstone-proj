require 'json'

module Data
  def save_book(book)
    File.write('./books.json', JSON.pretty_generate(book))
  end

  def save_music(music)
    File.write('./music.json', JSON.pretty_generate(music))
  end

  def load_books
    if File.exist?('./books.json')
      listbooks = File.open('./books.json')
      info = listbooks.read
      JSON.parse(info)
    else
      File.write('./books.json', [])
    end
  end

  def load_music
    if File.exist?('./music.json')
      listmusic = File.open('./music.json')
      info = listmusic.read
      JSON.parse(info)
    else
      File.write('./music.json', [])
    end
  end

  def save_labels(label)
    File.write('./labels.json', JSON.pretty_generate(label))
  end

  def save_genres(genre)
    File.write('./genres.json', JSON.pretty_generate(genre))
  end

  def load_genres
    if File.exist?('./genres.json')
      listgenres = File.open('./genres.json')
      info = listgenres.read
      JSON.parse(info)
    else
      File.write('./genres.json', [])
    end
  end

  def load_labels
    if File.exist?('./labels.json')
      listlabels = File.open('./labels.json')
      info = listlabels.read
      JSON.parse(info)
    else
      File.write('./labels.json', [])
    end
  end
end
