class TicTacToe

attr_accessor :board
  def initialize
    @board = Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2], #Top row
    [3,4,5], #Middle row
    [6,7,8], #Bottom row
    [0,3,6], #Left vertical
    [1,4,7], #middle vertical
    [2,5,8], #right vertical
    [0,4,8], #diagonal from left to right
    [2,4,6]  #diagonal from right to left
  ]

  def display_board
   puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
   puts "-----------"
   puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
   puts "-----------"
   puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(position, char)
    @board[position] = char
  end

  def position_taken?(index_i)
    ((@board[index_i] == "X") || (@board[index_i] == "O"))
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn_count
    number_of_turns = 0
    @board.each do |space|
    if space == "X" || space == "O"
        number_of_turns += 1
    end
  end
  return number_of_turns
end

def current_player
    if turn_count % 2 == 0
    "X"
    else
    "O"
  end
end

def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    char = current_player
    if valid_move?(index)
      move(index, char)
      display_board
    else
      turn
    end
end

def won?
  WIN_COMBINATIONS.detect do |win_combo|
    if (@board[win_combo[0]]) == "X" && (@board[win_combo[1]]) == "X" && (@board[win_combo[2]]) == "X"
      return win_combo
    elsif (@board[win_combo[0]]) == "O" && (@board[win_combo[1]]) == "O" && (@board[win_combo[2]]) == "O"
      return win_combo
    end
      false
  end
end

def full?
  @board.all?{|occupied| occupied != " "}
end


end
