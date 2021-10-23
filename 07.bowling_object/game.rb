require_relative './frame'

class Game
  def initialize(input_text)
    @frames = Frame.divide_by_frame(input_text)
    @point = 0
  end
  def calculate_score
    (0..9).each do |s|
      frame = @frames.slice(s)
      next_frame = @frames.slice(s + 1)
      after_next_frame = @frames.slice(s + 2)
      next_frame = [] if next_frame.nil?
      after_next_frame = [] if after_next_frame.nil?
      add_frame = next_frame + after_next_frame

      @point += if frame[0] == 10
        frame.sum + add_frame.slice(0, 2).sum
      elsif frame.sum == 10
        frame.sum + add_frame.slice(0)
      else
        frame.sum
      end
    end
    @point
  end
end

input_score = ARGV[0]
if __FILE__ == $PROGRAM_NAME
  game = Game.new(input_score)
  puts game.calculate_score
end
