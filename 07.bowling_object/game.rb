require_relative './frame'

class Game
  def initialize(input_text)
    frames = Frame.divide_by_frame(input_text)
    #=>[[6, 3], [9, 0], [0, 3], [8, 2], [7, 3], [10], [9, 1], [8, 0], [10], [6, 4, 5]]
    frames.map.with_index do |frame,index|
      @frames = Frame.new(*frame,index) #=>引数に6,3 が入る
      
    end
  end

  def calculate_total_score
  # 10フレームのスコアを足す
    @frames.map do |frame|
      frame.frame_score #=>[frame1の合計,...frame10の合計]
    end.sum #=>スコア計算結果
  end
end

# ここだけ別ファイルにする方も
input_text = ARGV[0]
if __FILE__ == $PROGRAM_NAME
  game = Game.new(input_text)
  # puts game.calculate_total_score
end

# Game.new('6,3,9,0,0,3,8,2,7,3,X,9,1,8,0,X,X,X,X')
