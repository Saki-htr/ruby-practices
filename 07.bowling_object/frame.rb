# frozen_string_literal: true

require_relative './game'
require_relative './shot'

class Frame
  def initialize(index, frames) #=>[[6, 3], [9, 0], [0, 3]]
    @index = index
    @current_frame = frames[index]
    @next_frame = frames[index + 1]
    @after_next_frame = frames[index + 2]
    
    # 追記
    if @next_frame == []
      @next_frame = 0
    end
    if @after_next_frame == []
      @after_next_frame = 0
    end
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
    @current_frame == [10]
  end

  def spare?
    @current_frame.sum == 10
  end

  def calc_normal_frame
    @current_frame.sum
  end

  def calc_strike_frame
    if @next_frame[1].nil?
      @current_frame[0] + @next_frame[0] + @after_next_frame[0]
    else
      @current_frame[0] + @next_frame[0] + @next_frame[1]
    end
  end

  def calc_spare_frame
    @current_frame.sum + @next_frame[0]
  end

  def last_frame?
    @index == 9
  end
end
