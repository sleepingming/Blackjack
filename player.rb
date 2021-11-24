require_relative 'hand'
require_relative 'deck'
require_relative 'bank'

class Player
  attr_accessor :bank
  attr_reader :hand

  def initialize(name)
    @name = name
    @bank = 100
    @hand = Hand.new
  end

  def take_cards(deck)
    2.times do
      current_card = deck.give_card
      @hand.cards << current_card
    end
  end

  def take_one_card(deck)
    if @hand.cards.length < 3
      current_card = deck.give_card
      @hand.cards << current_card
    end
  end

  def bet(bank)
    self.bank -= 10
    bank.current_bank += 10
  end
end
