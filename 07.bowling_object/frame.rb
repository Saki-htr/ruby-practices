# frozen_string_literal: true

require_relative './game'
require_relative './shot'

class Frame
  def initialize(index, frames)
    @index = index
    @current_frame = frames[index]
    @next_frame = frames[index + 1]
    @after_next_frame = frames[index + 2]
    binding.irb
  end

  def calc_frame_score
    if last_frame?
      calc_normal_frame
    elsif strike?
      calc_strike_frame
    elsif spare?
      calc_spare_frame
    else
      calc_normal_frame
    end
  end

  private

  def strike?
    @first_shot == 10
  end

  def spare?
    @first_shot + @second_shot == 10
  end

  def calc_normal_frame
    @first_shot + @second_shot + @third_shot
  end

  def calc_strike_frame
    if @next_frame[1].nil?
      @first_shot + @next_frame[0] + @after_next_frame[0]
    else
      @first_shot + @next_frame[0] + @next_frame[1]
    end
  end

  def calc_spare_frame
    @first_shot + @second_shot + @next_frame[0]
  end

  def last_frame?
    @index == 9
  end
end
