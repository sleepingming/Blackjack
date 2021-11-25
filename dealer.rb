require_relative 'hand'
require_relative 'deck'
require_relative 'bank'

class Dealer
  attr_accessor :bank
  attr_reader :hand

  def initialize
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
    if (@hand.cards.length < 3) && (@hand.current_points <= 17)
      current_card = deck.give_card
      @hand.cards << current_card
    end
  end

  def bet(bank)
    bank.current_bank += 10
    self.bank -= 10
  end
end
