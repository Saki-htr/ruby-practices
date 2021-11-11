# frozen_string_literal: true

require_relative './frame'

class Game
  def initialize(input_text)
    frames = Game.divide_by_frame(input_text)
    p frames
    @frames = frames.map.with_index do |_, index|
      Frame.new(index, frames[index..(index + 2)])
    end
  end

  def self.divide_by_frame(input_text)
    frame = []
    frames = []
    input_text.split(',').each do |mark|
      score = Shot.new(mark).score
      frame << score
      if frames.size <= 9
        if frame.size >= 2 || score == 10
          frames << frame.dup
          frame.clear
        end
      else
        frames.last << score
      end
    end
    frames
  end

  def calc_total_score
    @frames.map(&:calc_frame_score).sum
  end
end

input_text = ARGV[0]
if __FILE__ == $PROGRAM_NAME
  game = Game.new(input_text)
  puts game.calc_total_score
end
