require 'rspec'
require 'hand'

RSpec.describe 'hand' do
  subject(:hand) { Hand.new([]) }

  describe "adds cards" do
   let(:rspec_card) { Card.new(1, :rspec_suit) }
    
    it "adds a card" do
      
      hand.add_card(rspec_card)
      expect(hand.cards).to include(rspec_card)
    end
    
    it 'discards cards' do
    end
    
    it 'returns cards to deck' do
      hand
    end
  end
      


  describe 'recognizes combos' do
    let(:card1) { Card.new(1, :hearts) }
    let(:card2) { Card.new(1, :clubs) }
    let(:card3) { Card.new(1, :diamonds) }
    let(:card4) { Card.new(1, :spades) }
    let(:card5) { Card.new(2, :hearts) }
    let(:card6) { Card.new(3, :clubs) }
    let(:card7) { Card.new(4, :diamonds) }
    let(:card8) { Card.new(5, :spades) }
    let(:card9) { Card.new(2, :spades) }
    let(:card10) { Card.new(5, :spades) }
    let(:card11) { Card.new(2, :spades) }
    
    let(:flush_hand) { ... }

    # it "recognizes pairs do" do
    #   hand.add_card(card1)
    #   hand.add_card(card2)
    #   expect(hand.face_matches).to eq({1 => [:hearts, :clubs]})
    # end
    # it "recognizes matching suites" do
    #   hand.add_card(card1)
    #   hand.add_card(card3)
    #   hand.add_card(card2)
    #   hand.add_card(card4)
    #   expect(hand.suit_matches).to eq({ :hearts => [1,2], :clubs => [1,4] })
    # end
    
    describe "face match combos" do
      it "recognizes pairs" do 
        hand.add_card(card1)
        hand.add_card(card2)
        expect(hand.pair).to eq([1])
      end
    
      it "recognizes triples" do 
        hand.add_card(card1)
        hand.add_card(card3)
        hand.add_card(card2)
        expect(hand.triple).to eq([1])
      end
    
      it "recognizes 4 of a kind" do 
        hand.add_card(card1)
        hand.add_card(card3)
        hand.add_card(card2)
        hand.add_card(card4)
        expect(hand.four_of_kind).to eq([1])
      end
      
      it "recognizes a straight" do
        hand.add_card(card1)
        hand.add_card(card5)
        hand.add_card(card6)
        hand.add_card(card7)
        hand.add_card(card8)
        expect(hand.straight).to eq([1,2,3,4,5])
      end
      
      it "recognizes a full house" do
        hand.add_card(card1)
        hand.add_card(card2)
        hand.add_card(card3)
        hand.add_card(card5)
        hand.add_card(card9)
        expect(full_house_hand.full_house).to eq([1,1,1,2,2])
      end
      
    end
    
    describe "recognizes suit matches" do
      it "recognizes a flush" do
        hand.add_card(card4)
        hand.add_card(card8)
        hand.add_card(card9)
        hand.add_card(card10)
        hand.add_card(card11)
        expect(flush_hand.flush).to eq([1,2,2,5,5])
      end
    end
    
    describe "recognizes top combos" do
      let(:card6) { Card.new(1, :clubs) }
      let(:card7) { Card.new(2, :diamonds) }
      let(:card8) { Card.new(3, :spades) }
      let(:card9) { Card.new(4, :spades) }
      let(:card10) { Card.new(5, :spades) }
      let(:card11) { Card.new(2, :spades) }
      
      it "recognizes a straight flush" do 
      end
      
      
    end
      
      
      describe '#beats' do
        ... expect flush_hand to beat straight_hand
      end  
    
  end
end
  