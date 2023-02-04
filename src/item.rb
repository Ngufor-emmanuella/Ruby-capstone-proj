require 'date'

class Item
  attr_accessor :publish_date, :archived, :label
  attr_reader :id
  def initialize(publish_date, archived: false)
    @id = rand(100...1000)
    @publish_date = publish_date
    @archived = archived
    @label = nil
  end

  def genre=(genre)
    @genre = genre
    genre.items.push(self) unless genre.items.include?(self)
  end

  def author=(author)
    author.item = self
  end

  def modify_label(label)
    @label&.remove_item(self)
    label.add_item(self)
  end

  def can_be_archived?
    @now = Date.today
    @date = Date.parse(@publish_date)
    ((@now - @date) / 365).floor > 10
  end

  private :can_be_archived?

  def move_to_archive
    @archived = true if can_be_archived?
  end
end
