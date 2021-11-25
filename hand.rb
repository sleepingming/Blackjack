class Hand
  attr_accessor :cards

  def initialize
    @cards = []
  end

  def clear_hand
    @cards = []
  end

  def current_points
    founded_a = false
    points = 0
    @cards.each do |card|
      if card.card =~ /[0-910]/
        points += card.card.to_i
      elsif card.card =~ /[JDK]/
        points += 10
      elsif card.card =~ /[A]/
        points += 11
        founded_a = true
      end
    end
    points -= 10 if (founded_a == true) && (points > 21)
    points
  end

  def show_cards
    cards = []
    @cards.each do |card|
      cards << card.card + card.suit
    end
    cards
  end
end
