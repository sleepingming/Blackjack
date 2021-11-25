require_relative 'card'

class Deck
  attr_accessor :playable_deck

  def initialize
    @playable_deck = []
  end

  def give_card
    update_deck if @playable_deck.empty?
    current_card = @playable_deck.sample
    @playable_deck.delete(current_card)
    current_card
  end

  def update_deck
    Card::CARDS.each do |current_card|
      Card::SUITS.each do |current_suit|
        @playable_deck << Card.new(current_card, current_suit)
      end
    end
  end
end
