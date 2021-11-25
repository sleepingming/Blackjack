class Interface

  def main_message(player, dealer, bank)
    print "Ваши карты - #{player.hand.show_cards}, сумма очков - #{player.hand.current_points}\n"\
    "Карты дилера - #{'#' * dealer.hand.cards.length}\n"\
    "Банк - #{bank.current_bank} $\n"\
    "Ваш баланс - #{player.bank} $\n"\
    "Баланс дилера - #{dealer.bank} $\n"\
    "Действия:\n"\
    "(0) - пропустить ход\t (1) - взять карту\n"\
    "(2) - открыть карты\n"
    choice = gets.chomp
  end

  def play_again?
    print "(0) - сыграть ещё раз\t (1) - выйти\n"
    choice = gets.chomp
  end

  def all_points(player, dealer)
    print "Ваши карты - #{player.hand.show_cards}, Ваши очки - #{player.hand.current_points}\n"\
    "Карты дилера - #{dealer.hand.show_cards}, очки дилера #{dealer.hand.current_points}\n"
  end

  def excess_cards
    print "У вас уже 3 карты\n"
  end

  def player_out_of_money
    print "У Вас закончились деньги, вы проиграли\n"
  end

  def dealer_out_of_money
    print "У дилера закончились деньги, вы выиграли\n"
  end

  def draw
    print "Ничья\n"
  end

  def player_won
    print "Вы выиграли\n"
  end

  def player_lost
    print "Вы проиграли\n"
  end

  def exit
    print "Выход из игры...\n"
    abort
  end
end
