# frozen_string_literal: true

require_relative './frame'

class Game
  attr_reader :frames, :next_frames, :after_next_frame

  def initialize(input_text)
    frames = Frame.divide_by_frame(input_text)
    @frames = frames.map.with_index do |frame, index|
      Frame.new(*frame, index, frames[index + 1], frames[index + 2])
    end
  end

  def calculate_total_score
    @frames.map(&:calculate_frame_score).sum
  end
end

input_text = ARGV[0]
if __FILE__ == $PROGRAM_NAME
  game = Game.new(input_text)
  puts game.calculate_total_score
end
