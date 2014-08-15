require 'deck'
require 'card'
require 'player'

class Game
  attr_reader :deck, :players
  
  def initialize(num_players)
    @players = []
    num_players.times do |player_id|
      @players << Player.new("player#{player_id}")
    end
    @deck = Deck.new
    seed_hands
  end
  
  def seed_hands
    players.each do |player|
      player.hand.concat(deck.remove_cards!(7))
    end
  end
  
end