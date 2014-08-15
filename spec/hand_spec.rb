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
    
    let(:card12) { Card.new(1, :diamonds) }
    let(:card13) { Card.new(2, :diamonds) }
    let(:card14) { Card.new(3, :diamonds) }
    let(:card15) { Card.new(4, :diamonds) }
    let(:card16) { Card.new(5, :diamonds) }
    
    let(:card17) { Card.new(10, :diamonds) }
    let(:card18) { Card.new(11, :diamonds) }
    let(:card19) { Card.new(12, :diamonds) }
    let(:card20) { Card.new(13, :diamonds) }
    let(:card21) { Card.new(14, :diamonds) }

    
    
    let(:flush_hand) { Hand.new([:card8, :card9, :card10, :card11, :card4]) }
    let(:straight_hand) { Hand.new([:card1, :card5, :card6, :card7, :card8]) }
    let(:pair_hand) { Hand.new([:card1, :card2]) }
    let(:triple_hand) { Hand.new ([:card1, :card2, :card3 ]) }
    let(:four_of_kind_hand) { Hand.new([:card1, :card2, :card3, :card4]) }
    let(:full_house_hand) { Hand.new([:card1, :card2, :card3, :card9, :card11]) }
    let(:flush_hand) { Hand.new([:card4, :card8, :card9, :card10, :card11]) }
    let(:straight_flush_hand) { Hand.new([:card12, :card13, :card14, :card15, :card16]) }
    let(:flush_hand) { Hand.new([:card17, :card18, :card19, :card20, :card21]) }    
    
    describe "face match combos" do
      it "recognizes pairs" do 

        expect(pair_hand.pair).to eq([1])
      end
    
      it "recognizes triples" do 

        expect(triple_hand.triple).to eq([1])
      end
    
      it "recognizes 4 of a kind" do 

        expect(four_of_kind_hand.four_of_kind).to eq([1])
      end
      
      it "recognizes a straight" do

        expect(straight_hand.straight).to eq([1,2,3,4,5])
      end
      
      it "recognizes a full house" do

        expect(full_house_hand.full_house).to eq([1,1,1,2,2])
      end
      
    end
    
    describe "recognizes suit matches" do
      it "recognizes a flush" do

        expect(flush_hand.flush).to eq([1,2,2,5,5])
      end
    end
    
    describe "recognizes top combos" do
      
      it "recognizes a straight flush" do 
        expect(straight_flush_hand.straight_flush).to eq({ :diamonds => [1,2,3,4,5] })
      end
      
      it "recognizes royal flush" do
        expect(royal_flush_hand.royal_flush).to eq( { :diamonds => [10,11,12,13,14] } )
      end
      
    end
      
      
      describe '#beats'
        # ... expect flush_hand to beat straight_hand
      end  
    
  end
end
  