require 'rspec'
require 'game'

RSpec.describe "Game start" do
  subject(:game) { Game.new(2) }
  it "gives each player 7 cards" do
    does_each_player_have_7_cards = game.players.all? do |player|
      player.hand.length == 7
    end
    expect(does_each_player_have_7_cards).to be true
  end
  
  
end