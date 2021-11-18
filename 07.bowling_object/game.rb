# frozen_string_literal: true

require_relative './frame'

class Game
  def initialize(input_text)
    frames = Game.divide_by_frame(input_text)
    @frames = frames.map.with_index do |frame, index|
      Frame.new(index, frames,*frame,)
    end
  end

  def self.divide_by_frame(input_text)
    frame = []
    frames = []
    input_text.split(',').each do |mark|
      frame << mark
      if frames.size <= 9
        if frame.size >= 2 || mark == 'X'
          frames << frame.dup
          frame.clear
        end
      else
        frames.last << mark
      end
    end
    frames
  end

  def calc_total_score
    @frames.map.with_index do |frame|
      frame.calc_frame_score
    end.sum
  end
end

input_text = ARGV[0]
if __FILE__ == $PROGRAM_NAME
  game = Game.new(input_text)
  puts game.calc_total_score
end
