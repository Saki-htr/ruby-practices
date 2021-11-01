# frozen_string_literal: true

require_relative './game'
require_relative './shot'

class Frame
  def initialize(index, frames, first_mark, second_mark = nil, third_mark = nil)
    @index = index
    @next_frame = frames[index + 1]
    @after_next_frame = frames[index + 2]
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
    first_shot_score == 10
  end

  def spare?
    first_shot_score + second_shot_score == 10
  end

  def calc_normal_frame
    first_shot_score + second_shot_score + third_shot_score
  end

  def calc_strike_frame
    if @next_frame[1].nil?
      first_shot_score + @next_frame[0] + @after_next_frame[0]
    else
      first_shot_score + @next_frame[0] + @next_frame[1]
    end
  end

  def calc_spare_frame
    first_shot_score + second_shot_score + @next_frame[0]
  end

  def last_frame?
    @index == 9
  end
end
