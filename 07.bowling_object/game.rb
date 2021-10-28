require_relative './frame'

class Game
  attr_reader :frames #クラス外から@framesを取得可
  def initialize(input_text)
    frames = Frame.divide_by_frame(input_text)
    #=>[[6, 3], [9, 0], [0, 3], [8, 2], [7, 3], [10], [9, 1], [8, 0], [10], [6, 4, 5]]

    @frames = frames.map.with_index do |frame,index|
      Frame.new(*frame,index) #=>引数に6,3 が入る
    end #=>frameｸﾗｽのｲﾝｽﾀﾝｽ10個の入った配列

    @next_frames = @frames.map.with_index do |frame, index|
      @frames[index + 1]
    end

    @after_next_frames = @frames.map.with_index do |frame, index|
      @frames[index + 2]
    end
  
  end
  # この中で@frames[i+1]すると次のフレームが取れる

  # 10フレームのスコアを足す
  def calculate_total_score
    @frames.map do |frame|
      frame.frame_score
      #=>[frame1の合計,...frame10の合計]
    end.sum
  end
end

# ここだけ別ファイルにする方も
input_text = ARGV[0]
if __FILE__ == $PROGRAM_NAME
  game = Game.new(input_text)
  # p game.calculate_score

  # puts game.calculate_total_score
end

