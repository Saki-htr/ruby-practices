class Shot
  attr_reader :mark
  def initialize(mark)
    @mark = mark.split(',')
  end
  def change_to_integer
    @mark.map do |m|
      if m == 'X'
        m = 10
      end
      m.to_i
    end
  end
end
