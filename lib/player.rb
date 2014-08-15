require 'hand'

class Player
  attr_accessor :hand
  def initialize(name)
    @name = name
    @hand = []
  end
  
end