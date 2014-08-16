require 'rspec'
require 'game'

RSpec.describe "Game start" do
  subject(:game) { Game.new(2) }
  let(:hand){ double "hand" }
  describe "It should set up the game on initialization" do
    it "gives each player 7 cards" do
      does_each_player_have_7_cards = game.players.all? do |player|
        player.hand.cards.length == 7
      end
      expect(does_each_player_have_7_cards).to be true
    end
    
    it "subtacts the initial bet from the players"  do 
      do_all_players_bet = game.players.all? do |player|
        player.pot == 20
      end
      expect(do_all_players_bet).to be true
    end
    
    it "it collects bets" do 
      expect(game.winning_pot).to eq(40)
    end
  end 
  
  describe "it should be able to run the game" do 
    
    it "determines a winner" do 
      expect(game.find_winner).to_not be_nil
    end
    
    
    
  end
  
end