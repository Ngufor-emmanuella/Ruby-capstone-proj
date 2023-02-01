require 'date'

class Item
  attr_reader :genre, :aouthor, :label
  attr_accessor :id, :archived, :publish_date, :title

  def initialize(publish_date:, title:, archived: false)
    @id = Random.rand(1..1000)
    @publish_date = Date.parse(publish_date)
    @archived = archived
    @title = title
  end

  def can_be_archived?
    (Date.today.year - @publish_date.year) > 10
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  def label=(label)
    @label = label
    label.items.push(self) unless label.items.include?(self)
  end
  private :can_be_archived?
end