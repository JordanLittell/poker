require 'card'

class Hand
  CARD_RANK = [:royal_flush, :straight_flush, :four_of_kind, :flush, :straight, :triple, :pair]
  
  attr_reader :cards
  
  def initialize(cards)
    @cards = cards
  end
  
  def add_card(card)
    @cards << card
  end
  
  def remove_card(card)
    @cards -= card
  end
  
  def pair
    matches = num_face_matches(2)
    matches.empty? ? false : matches
  end
  
  def triple
    matches = num_face_matches(3)
    matches.empty? ? false : matches
  end
  
  def four_of_kind
    matches = num_face_matches(4)
    matches.empty? ? false : matches    
  end

  def full_house
    matches = [] 
    matches += num_face_matches(2)*2 + num_face_matches(3)*3
    matches.length == 5 ? matches.sort : false
  end
  
  def straight
    hand = []
    sorted_hand = @cards.sort_by {|card| card.face}.reverse
    sorted_hand.each_with_index do |card, index|
      if index == @cards.length - 1
        hand << card.face
        break
      end
      hand << card.face if (sorted_hand[index].face - sorted_hand[index+1].face) == 1
    end

    hand.length == 5 ? hand.sort : false
  end
  
  def straight_flush
    matches = []
    return suit_matches if flush && straight
    false
  end
  
  def royal_flush
    if suit_matches.values[0].none?{ |v| v < 10}
      return suit_matches if flush && straight 
    end
    false
  end
  
  def flush
    matches = []

    if suit_matches.values[0].count == 5 
      suit_matches.each do |key, value|
        matches += value
      end
      return matches.sort
    end
    false
  end
  
  def best_hand
    return :royal_flush if royal_flush
    return :straight_flush if straight_flush
    return :four_of_kind if four_of_kind
    return :full_house if full_house
    return :flush if flush
    return :straight if straight
    return :triple if triple
    return :pair if pair
  end
  
  private

  def num_face_matches(num)
    matches = face_matches.select { |key, value| value.length == num }.keys
  end

  def face_matches
    combos_hash = Hash.new(){ |h,k| h[k] = [] }
    self.cards.each_with_index do |card1, index|
      self.cards[index..self.cards.length].each do |card2|
        if card1.face == card2.face
          combos_hash[card1.face] << card1.suit unless combos_hash[card1.face].include?(card1.suit)
          combos_hash[card2.face] << card2.suit unless combos_hash[card2.face].include?(card2.suit)
        end
      end
    end
    combos_hash
  end

  def suit_matches
    combos_hash = Hash.new(){ |h,k| h[k] = [] }
    self.cards.each_with_index do |card1, index|
      self.cards[index..self.cards.length].each do |card2|
        if card1.face == card2.face
          combos_hash[card1.suit] << card1.face unless combos_hash[card1.suit].include?(card1.face)
          combos_hash[card2.suit] << card2.face unless combos_hash[card2.suit].include?(card2.face)
        end
      end
    end
    combos_hash
  end

end