require_relative 'deck'
require_relative 'player'

class Game
  attr_reader :deck, :players, :winning_pot
  
  def initialize(num_players)
    @players = []
    @winning_pot = 0
    @betters = false 
    initialize_players(num_players)
    collect_entry_fee
    deal_cards
  end
  
  def better?
    @betters
  end
  
  def run 
    @players.each do |player|
      player.get_user_bet(:bet)
    end
    @players.each do |player|
      p "#{player.name} had #{player.hand.cards.map{|card| card.face}}"
    end
    p "the winner was #{find_winner.name}"
  end
  
  def find_winner
    winner_hash = {}
    @players.each do |player|
      winner_hash[player] = 200 unless player.hand.best_hand
      winner_hash[player] = Hand::HAND_HEIRARCHY.index(player.hand.best_hand)
    end
    winner_hash.each do |key, value|
      return key if value == winner_hash.values.min
    end
  end

  private
  
    def initialize_players(num_players)
      num_players.times do |player_id|
        @players << Player.new("player#{player_id}", 50)
      end
    end

    def collect_entry_fee
      collect_bet(30)
    end
    
    def collect_bet(bet)
      @players.each do |player|
        @winning_pot += player.reduce_pot_by(bet)
      end
    end

    def deal_cards
      @deck = Deck.new
      players.each do |player|
        player.hand = Hand.new(deck.remove_cards!(7))
      end
    end
end
