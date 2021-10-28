require_relative './game'
require_relative './shot'

class Frame
  def initialize(first_mark,second_mark=nil,third_mark=nil,index)
    @first_shot = Shot.new(first_mark)
    @second_shot = Shot.new(second_mark)
    @third_shot = Shot.new(third_mark)
    @index = index
  end

  def self.divide_by_frame(input_text)#フレームごとにわける
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

  def calculate_frame_score(next_frame,after_next_frame) #⇑を使ってフレームごとの計算をさせる
    if last_frame?
      @first_shot.score + @second_shot.score + @third_shot.score
    elsif strike?
      strike_calculate(next_frame,after_next_frame)

    elsif spare?
      spare_calculate(next_frame)
    else
      @first_shot.score + @second_shot.score + @third_shot.score
    end
  end

  def first_shot_score
    @first_shot.score
  end
  def second_shot_score
    @second_shot.score
  end
  def third_shot_score
    @third_shot.score
  end

  # private #privateはレシーバをとって呼び出せない
  def strike? #true/false
    @first_shot.score == 10
  end
  def spare?
    @first_shot.score + @second_shot.score == 10
  end

  def strike_calulate(next_frame,after_next_frame)
    #=>Integer(ストライクの場合のフレーム計算)
  end
  def spare_calculate(next_frame)
    @first_shot
  end

  def last_frame?
    @index == 9
  end
end



