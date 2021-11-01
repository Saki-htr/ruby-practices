# frozen_string_literal: true

require_relative './frame'

class Game
  def initialize(input_text)
    frames = Frame.divide_by_frame(input_text)
    @frames = frames.map.with_index do |frame, index|
      Frame.new(index, frames, *frame)
      #引数のframesは、frames[index + 1], frames[index + 2]と書き、Frameのinitializeメソッドで引数を2つ用意したかったのですが、rubocopにparameterを5個以内にするよう指摘されたので、このように書きました

    end
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
