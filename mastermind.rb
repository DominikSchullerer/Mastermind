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

guess = Guess.new([1, 1, 3, 4])
sequence = KIPlayer.new.make_sequence
p guess.guess
p sequence

gm = GM.new
gm.set_pegs(guess, sequence)
p guess.pegs
