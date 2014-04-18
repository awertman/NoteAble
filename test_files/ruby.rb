  def clear_screen!
    print "\e[2J"
  end

  def move_to_home!
    print "\e[H"
  end

class Cell
  attr_reader :index, :row, :col, :box
  attr_accessor :value, :possible_nums
  def initialize(value, index)
    @value = value
    @index = index
    @row = gen_row
    @col = gen_col
    @box = gen_box
    @possible_nums = []
  end
  def gen_row
    @index / 9
  end

  def gen_col
    @index % 9
  end

  def gen_box
    ((@row / 3) * 3) + (@col / 3) 
  end

end


class SudokuBoard
  attr_accessor :board

  def initialize(given_numbers)
    numbers_list = given_numbers.split(//)
    @board = []
    numbers_list.each.with_index do |indiv_num, index|
      @board << Cell.new(indiv_num, index)
    end
    @NUMS_CONST = ["1","2","3","4","5","6","7","8","9"]
    ##note## Test task 4, in ruby file##note##
  end
  
  def is_solved?
    def is_solved?
  #Check if each row has all numbers
  rows_solved = true
  (0..8).each do |row|
    all_values = []
    @board.each do |cell|
      if cell.row == row
        all_values << cell.value
      end
    end
    rows_solved = false if all_values.sort != @NUMS_CONST
  end
  
  #Check if each col has all numbers
  cols_solved = true
  (0..8).each do |col|
    all_values = []
    @board.each do |cell|
      if cell.col == col
        all_values << cell.value
      end
    end
    cols_solved = false if all_values.sort != @NUMS_CONST
  end
  
  #Check if each box has all numbers
  boxes_solved = true
  (0..8).each do |box|
    all_values = []
    @board.each do |cell|
      if cell.box == box
        all_values << cell.value
      end
    end
    boxes_solved = false if all_values.sort != @NUMS_CONST
  end
  
  return true if rows_solved && cols_solved && boxes_solved
  
end
  end
  
  def gen_nums_possible
    @board.each do |cell|
      if cell.value != '0'
        cell.possible_nums = [cell.value]
      else
        cell.possible_nums = gen_row_possible(cell) & gen_col_possible(cell) & gen_box_possible(cell)
      end
    end

  end
  
  def gen_row_possible(cell)
    possible_nums = @NUMS_CONST.clone
    @board.each do |other_cell|
      if (other_cell.row == cell.row) && (other_cell.value != '0')
        possible_nums.delete(other_cell.value)
      end
    end
    return possible_nums
  end
  
  def gen_col_possible(cell)
    possible_nums = @NUMS_CONST.clone
    @board.each do |other_cell|
      if (other_cell.col == cell.col) && (other_cell.value != '0')
        possible_nums.delete(other_cell.value)
      end
    end
    return possible_nums
  end
  
  def gen_box_possible(cell)
    possible_nums = @NUMS_CONST.clone
    @board.each do |other_cell|
      if (other_cell.box == cell.box) && (other_cell.value != '0')
        possible_nums.delete(other_cell.value)
      end
    end
    return possible_nums
  end

  def to_s
    string_of_values = "-----------------------------------\n"
    test_array = []
    second_array = []

    @board.each do |cell|
      test_array << cell.value
    end
    test_array.first.chars.each_slice(9).map(&:join)
    
    test_array.each do |chunk|
      chunk.each_char do |letter|
        second_array << (letter + " | ")
      end
    end
    second_array.each_slice(9) do |slice|
      string_of_values << slice.join("")
      string_of_values << "\n"
      string_of_values << "-----------------------------------\n"
    end
    return string_of_values
  end
  
end

class Game
  attr_reader :total_moves, :total_passes

  def initialize(board_numbers)
    @game_board = SudokuBoard.new(board_numbers)
    @total_moves = 0
    @total_passes = 0
  end

  #bootmark Test task 1, in ruby file</t>

  def play
    board_view_update
    puts "Press enter when you're ready to solve..."
    gets.chomp

    until @game_board.is_solved?
      @game_board.gen_nums_possible
      @game_board.board.each do |cell|
         if (cell.possible_nums.length == 1) && (cell.value == "0")
          cell.value = cell.possible_nums.first
          @total_moves += 1
          sleep(0.01)
          board_view_update
        end
      end
      @total_passes += 1
    end

    puts "\n"
    puts "Your board is solved, CONGRATULATIONS!!!!!!!"
    puts "\n"
  end

  def board_view_update
    clear_screen!
    move_to_home!
    puts "Here is your Sudoku board:"
    puts "\n"
    puts @game_board
    puts "\n"
    puts "Total Moves: #{@total_moves}"
    puts "Total Passes: #{@total_passes}"
  end



end

# test_numbers = "619030040270061008000047621486302079000014580031009060005720806320106057160400030"

# new_game = Game.new(test_numbers)
# new_game.play


