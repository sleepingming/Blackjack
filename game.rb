require_relative 'dealer'
require_relative 'player'
require_relative 'bank'
require_relative 'deck'
require_relative 'interface'

class Game
  def initialize(name)
    @player = Player.new(name)
    @dealer = Dealer.new
    @bank = Bank.new
    @deck = Deck.new
    @interface = Interface.new
  end

  def start_game
    @player.take_cards(@deck)
    @dealer.take_cards(@deck)
    @player.bet(@bank)
    @dealer.bet(@bank)
    player_turn
  end

  def player_turn
    game_over if (@player.hand.cards.length > 2) || (@dealer.hand.cards.length > 2)
    choice = @interface.main_message(@player, @dealer, @bank)
    case choice
    when '0'
      dealer_turn
    when '1'
      if @player.hand.cards.length > 2
        @interface.excess_cards
      else
        @player.take_one_card(@deck)
        dealer_turn
      end
    when '2'
      game_over
    end
  end

  def dealer_turn
    @dealer.take_one_card(@deck) if @dealer.hand.current_points <= 17
    player_turn
  end

  def game_over
    show_results
    who_lost
    choice = @interface.play_again?
    case choice
    when '0'
      @player.hand.clear_hand
      @dealer.hand.clear_hand
      start_game
    when '1'
      @interface.exit
    end
  end

  def who_lost
    if @player.bank.zero?
      @interface.player_out_of_money
      abort
    end

    if @dealer.bank.zero?
      @interface.dealer_out_of_money
      abort
    end
  end

  def show_results
    @interface.all_points(@player, @dealer)
    if (@player.hand.current_points == @dealer.hand.current_points) && (@player.hand.current_points <= 21) && (@dealer.hand.current_points <= 21)
      @interface.draw
      @bank.draw(@player, @dealer)
    elsif (@player.hand.current_points >= @dealer.hand.current_points) && (@player.hand.current_points <= 21)
      @interface.player_won
      @bank.player_wins(@player)
    elsif (@player.hand.current_points <= @dealer.hand.current_points) && (@dealer.hand.current_points <= 21)
      @interface.player_lost
      @bank.dealer_wins(@dealer)
    end
  end
end

print "Введите Ваше имя: \n"
name = gets.chomp

Game.new(name).start_game
