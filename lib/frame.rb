class Frame
  attr_reader :next_frame, :rolls

  def initialize(next_frame)
    @rolls = []
    @next_frame = next_frame
  end

  def spare?
    if points_from_rolls == 10 && !strike?
      true
    else
      false
    end
  end

  def strike?
    rolls[0] == 10
  end

  def has_more_rolls?
    if rolls.size == 2 || strike? 
      false
    else
      true
    end
  end

  def score
    if spare? && !next_frame.rolls[0].nil? 
      @score = points_from_rolls + next_frame.rolls[0]
    elsif strike? && !next_frame.has_more_rolls?
      if next_frame.strike? && !next_frame.next_frame.has_more_rolls?
        @score = 20 + next_frame.next_frame.rolls[0]
      else
        @score = 10 + next_frame.points_from_rolls
      end
    else
      @score = points_from_rolls
    end
  end

  def points_from_rolls
    points = rolls.reduce(:+)
    points ? points : 0
  end
end
