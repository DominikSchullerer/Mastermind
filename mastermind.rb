# frozen_string_literal: true

# Rules
module Rules
  COLORS = %w[Red Green Yellow Blue Orange Violet].freeze
end

# KIPlayer
class KIPlayer
  def make_sequence
    sequence = []
    4.times do
      i = rand(Rules::COLORS.length)
      sequence << Rules::COLORS[i]
    end
    sequence
  end
end
