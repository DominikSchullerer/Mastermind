# frozen_string_literal: true

# Rules
module Rules
  COLORS = %w[Red Green Yellow Blue Orange Violet].freeze

  def self.to_colors(numbers)
    numbers.map do |number|
      Rules::COLORS[number]
    end
  end

  def self.get_pegs(guess, sequence)
    pegs = []
    number_of_black_pegs(guess, sequence).times do
      pegs << 'Black'
    end
    number_of_white_pegs(guess, sequence, pegs).times do
      pegs << 'White'
    end
    pegs
  end

  def self.number_of_black_pegs(guess, sequence)
    blacks = 0
    guess.guess.each_index do |index|
      blacks += 1 if guess.guess[index] == sequence[index]
    end
    blacks
  end

  def self.number_of_white_pegs(guess, sequence, pegs)
    whites = Rules::COLORS.reduce(0) do |sum, color|
      sum + [guess.guess.count(color), sequence.count(color)].min
    end
    whites - pegs.length
  end

  def self.valid_input?(input)
    return false unless input.length == 4

    input.each do |entry|
      return false unless !Integer(self).nil? rescue false
      return false unless entry.to_i >= 1 && entry.to_i <= COLORS.length
    end
    true
  end
end

# KIPlayer
class KIPlayer
  def make_sequence
    numbers = []
    4.times do
      numbers << rand(Rules::COLORS.length)
    end
    Rules.to_colors(numbers)
  end
end

# Guess
class Guess
  attr_reader :guess, :pegs

  def initialize(numbers)
    @guess = Rules.to_colors(numbers)
  end

  def set_pegs(pegs)
    @pegs = pegs
  end
end

# GM
class GM
  def set_pegs(guess, sequence)
    guess.set_pegs(Rules.get_pegs(guess, sequence))
  end
end

# Board
class Board
  attr_reader :guesses

  def initialize
    @guesses = []
  end

  def add_guess(guess)
    @guesses << guess
  end

  def draw_board
    @guesses.each_with_index do |guess, index|
      puts "Guess Nr. #{index + 1}:"
      puts "Your guess: #{guess.guess}"
      puts "Your result: #{guess.pegs}"
      puts ''
    end
  end
end

# Player
class Player
  def get_guess
    input_is_valid = false
    until input_is_valid
      input = prompt_guess.split(' ')
      input_is_valid = Rules.valid_input?(input)
    end
    input = input.map { |entry| entry.to_i - 1 }
    Guess.new(input)
  end

  private

  def prompt_guess
    puts 'The sequence can consist of the colors: '
    Rules::COLORS.each_with_index do |color, index|
      puts "#{index + 1}: #{color} "
    end
    puts 'Enter your guess (numbers seperated by spaces): '
    gets
  end
end

player = Player.new
guess = player.get_guess
p guess
