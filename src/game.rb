require_relative './item'
require 'Date'

class Game < Item
  attr_accessor :multiplayer, :last_played_at
  attr_reader :publish_date

  def initialize(multiplayer, last_played_at, publish_date)
    super(publish_date)
    @id = Random.rand(100...1000)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  private

  def can_be_archived?
    super && (Date.today.year - Date.parse(last_played_at).year) > 2
  end

  public

  def as_json()
    {
      id: @id,
      multiplayer: @multiplayer,
      last_played_at: @last_played_at,
      publish_date: @publish_date
    }
  end
end