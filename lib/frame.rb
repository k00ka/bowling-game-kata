class Frame
  attr_reader :next_frame, :rolls

  def initialize(next_frame)
    @rolls = []
    @next_frame = next_frame
  end

  def spare?
    points_from_rolls == 10
  end

  def has_more_rolls?
    !(rolls.size == 2)
  end

  def score
    if spare? && !next_frame.rolls[0].nil? 
      @score = points_from_rolls + next_frame.rolls[0]
    else
      @score = points_from_rolls
    end
  end

  private
  def points_from_rolls
    points = rolls.reduce(:+)
    points ? points : 0
  end
end
