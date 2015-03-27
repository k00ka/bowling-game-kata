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

  def points_from_rolls
    points = rolls.reduce(:+)
    points ? points : 0
  end

  def score
    if spare_scoring_applies? 
      spare_scoring
    elsif strike_scoring_applies? 
      strike_scoring
    else
      @score = points_from_rolls
    end
  end

  private

  def spare_scoring_applies?
    spare? && !next_frame.rolls[0].nil? 
  end

  def strike_scoring_applies?
    strike? && next_frame.rolls.size >= 1 
  end

  def spare_scoring
    @score = points_from_rolls + next_frame.rolls[0]
  end

  def strike_scoring
    if next_frame.class == TenthFrame 
      if next_frame.rolls.size >= 2
        @score = 10 + next_frame.rolls[0,2].reduce(:+)
      else
        @score = points_from_rolls
      end
    elsif next_frame.strike? && next_frame.next_frame.rolls.size >= 1
      @score = 20 + next_frame.next_frame.rolls[0]
    else
      @score = 10 + next_frame.points_from_rolls
    end
  end
end
