require "card"
require "rspec"

RSpec.describe Card do 
  let(:card) { Card.new(:A,:spades) }
  
  it "should have a face value" do 
    expect(card.face).to eq(:A)
    
  end
  
  it "should have a suite" do 
    expect(card.suit).to eq(:spades)
  end
  
end

