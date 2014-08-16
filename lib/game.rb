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
  
  def prompt_bets
    @players.each do |player|
      p "#{player.name} you have #{player.hand.cards}. Place your bet"
      bet = gets.chomp.to_i
      collect_bet(bet, player)
    end  
  end
  
  def player_discard(player)
    #returns number of cards discarded
      p "enter the indices of cards you want to discard"
      input = gets.chomp.split(' ').map(&:to_i)
      player.discard(input)
      input.length
  end
    
  
  def replace_card(player, n)
    replacements = deck.remove_cards!(n)
    replacements.each do |card|
      player.hand.add_card(card)
    end
  end

  def run 
    #collect the bets
    prompt_bets
    #allow users to replace cards
    @players.each do |player|
      replace_card(player, player_discard(player))
    end
    prompt_bets
    #allow users to bet again 

#     @players.each do |player|
#       p "#{player.name} had #{player.hand.cards.map{|card| card.face}}"
#     end
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
      @players.each do |player|
        collect_bet(30, player)
      end
    end
    
    def collect_bet(bet, player)
        @winning_pot += player.reduce_pot_by(bet)
    end

    def deal_cards
      @deck = Deck.new
      players.each do |player|
        player.hand = Hand.new(deck.remove_cards!(7))
      end
    end
end
