require_relative './shot'

class Frame
  def initialize(first_mark,second_mark,third_mark)
    @first_shot = Shot.new(first_mark)
    @second_shot = Shot.new(second_mark)
    @third_shot = Shot.new(third_mark)
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
end

