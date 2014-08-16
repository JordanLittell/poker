# -*- coding: utf-8 -*-
class Card
  attr_reader :face, :suit

  SUIT = {
    :spades => "♠",
    :hearts => "♥",
    :diamonds => "♦",
    :clubs => "♣"
  }
  def initialize(face, suit)
    @face = face
    @suit = suit
  end
  
  def inspect 
    "#{face}#{SUIT[suit]}"
  end
  
end