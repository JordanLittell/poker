require 'deck'
require 'card'
require 'player'

class Game
  attr_reader :deck, :players, :winning_pot
  
  def initialize(num_players)
    @players = []
    @winning_pot = 0
    initialize_players(num_players)
    collect_initial_bets
    deal_cards
  end
  
  private 
  
    def initialize_players(num_players)
      num_players.times do |player_id|
        @players << Player.new("player#{player_id}", 50)
      end
    end
  
    def collect_initial_bets
      @players.each do |player|
        @winning_pot += player.reduce_pot_by(30)
      end
    end
  
    def deal_cards
      @deck = Deck.new
      players.each do |player|
        player.hand = Hand.new(deck.remove_cards!(7))
      end
    end
  
  
end