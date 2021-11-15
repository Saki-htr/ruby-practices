# frozen_string_literal: true

require_relative './game'
require_relative './shot'

class Frame
  def initialize(index,first_mark,second_mark=0,third_mark=0)
    @index = index
    @first_shot = Shot.new(first_mark)
    @second_shot = Shot.new(second_mark)
    @third_shot = Shot.new(third_mark)
  end

  def calc_frame_score(next_frame,after_next_frame)
    if last_frame?
      calc_normal_frame
    elsif strike?
      calc_strike_frame(next_frame,after_next_frame)
    elsif spare?
      calc_spare_frame(next_frame)
    else
      calc_normal_frame
    end
  end

  private

  def first_shot_score
    @first_shot.score
  end
  def second_shot_score
    @second_shot.score
  end
  def third_shot_score
    @third_shot.score
  end
  def strike?
    @current_frame == [10]
  end

  def spare?
    first_shot_score + second_shot_score  == 10
  end

  def calc_normal_frame
    first_shot_score + second_shot_score + third_shot_score
  end

  def calc_strike_frame(next_frame,after_next_frame)
    if next_frame[1].nil?
      @current_frame[0] + @next_frame[0] + @after_next_frame[0]
    else
      @current_frame[0] + @next_frame[0] + @next_frame[1]
    end
  end
  
  def calc_spare_frame(next_frame)
    binding.irb
    first_shot_score + second_shot_score + @next_frame[0]
  end

  def last_frame?
    @index == 9
  end
end
