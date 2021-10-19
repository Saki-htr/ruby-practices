require_relative './shot'

class Frame
  def initialize(score)
    @shot = Shot.new(score).change_to_integer
  end
  def divide_by_frame
    frame = []
    frames = []
    @shot.each do |x|
      frame << x
      if frames.size <= 9
        if frame.size >= 2 || x == 10
          frames << frame.dup
          frame.clear
        end
      else
        frames.last << x
      end
    end
    frames
  end
end
