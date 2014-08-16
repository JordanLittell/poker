require "rspec"
require "player"


RSpec.describe Player do
  let(:game){ Game.new(1) }
  subject(:player) { game.players[0] }
  
  describe "player has pot and a hand" do
    
    it "should have a pot" do
      expect(player.pot).to_not be_nil
    end
    
    it "should have a hand" do 
      expect(player.hand).to_not be_nil
    end
    
    it "should have a name" do 
      expect(player.name).to eq("player0")
    end
    
  end
  
  describe "player class can get user input" do 
    before do 
      player.discard([0,1,2])
    end
    it "should ask for cards to discard" do 
      expect(player.hand.cards.length).to eq(4)
    end
     
    it "should ask to fold, see, or raise" do 
      expect(player.fold).to eq("#{player.name} left the game")
      expect(player.out).to eq(true)
      
    end
    
    it "should return what the player raises" do
      expect(player.raise(50)).to be_a(Integer)
    end
    
    it "should properly see other player's bet" do 
      expect(player.see(30)).to be_a(Integer)
    end
  
  end
      
end 