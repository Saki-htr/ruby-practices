class Shot
  attr_reader :mark
  def initialize(mark)
    @mark = mark
  end
  def score #記号→数値に変換
    @mark == 'X' ? 10 : @mark.to_i
  end
end


