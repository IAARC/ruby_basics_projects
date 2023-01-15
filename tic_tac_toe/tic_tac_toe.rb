class Player
  attr_reader :name, :symbol
  attr_accessor :position

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
    @position = []
  end

  def add_movement(movement)
    @position.push(movement)
  end

  def win?
    win_row = []
    rows_positions_for_win = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
    win = false

    @position.each do |value|
      win_row.push(value)
    end
    win_row.repeated_combination(3) do |combination|
      win = true if rows_positions_for_win.any?(combination)
    end
    win
  end

  def win_message
    "#{@name} wins!"
  end

  def valid_number?(movement)
    movement >= 1 && movement <= 9
  end

  def valid_movement?(movement)
    position.none?(movement)
  end
end

def cat_game?(player1, player2)
  true if (player1.win? == false && player2.win? == false) && (player1.position.length == 5 && player2.position.length == 4)
end

turn = 0
table = "
1|2|3\n_____
4|5|6\n_____
7|8|9"
puts 'Select the name of player 1!'
name_player1 = gets.chomp
puts 'Select the name of player 2!'
name_player2 = gets.chomp
puts "#{name_player1}, select X or O"
symbol_player1 = gets.chomp.upcase
until symbol_player1.include?('X') || symbol_player1.include?('O')
  puts 'Please, select X or O'
  symbol_player1 = gets.chomp.upcase
end
symbol_player2 = symbol_player1.include?('X') ? 'O' : 'X'
player1 = Player.new(name_player1, symbol_player1)
player2 = Player.new(name_player2, symbol_player2)
until player1.win? || player2.win? || cat_game?(player1, player2)
  if turn.even?
    puts "#{player1.name}, select the position where you want to play"
    puts table
    player_selection = gets.chomp.to_i
    until player1.valid_number?(player_selection)
      puts 'Please, select a number!'
      player_selection = gets.chomp.to_i
    end
    until player1.valid_movement?(player_selection) && player2.valid_movement?(player_selection) && player1.valid_number?(player_selection)
      puts 'Please, select a position that has not been played!'
      player_selection = gets.chomp.to_i
    end
    player1.add_movement(player_selection.to_i)
    table.sub!(player_selection.to_s, player1.symbol)
  else
    puts "#{player2.name}, select the position where you want to play"
    puts table
    player_selection = gets.chomp.to_i
    until player2.valid_number?(player_selection)
      puts 'Please, select a number!'
      player_selection = gets.chomp.to_i
    end
    until player1.valid_movement?(player_selection) && player2.valid_movement?(player_selection) && player2.valid_number?(player_selection)
      puts 'Please, select a position that has not been played!'
      player_selection = gets.chomp.to_i
    end
    player2.add_movement(player_selection.to_i)
    table.sub!(player_selection.to_s, player2.symbol)
  end
  turn += 1
end
if player1.win?
  puts "#{table} \n #{player1.win_message}"
elsif player2.win?
  puts "#{table} \n #{player2.win_message}"
else
  puts "#{table} \n Cat's game!"
end
