class Card
  attr_reader :card, :suit

  CARDS = %w[2 3 4 5 6 7 8 9 10 J D K A]
  SUITS = ['♠', '♥', '♣', '♦']

  def initialize(card, suit)
    @card = card
    @suit = suit
  end
