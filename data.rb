require 'json'

module Data
  def save_book(book)
    File.write('./books.json', JSON.pretty_generate(book))
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

  def save_labels(label)
    File.write('./labels.json', JSON.pretty_generate(label))
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
