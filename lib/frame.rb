class Frame
  attr_reader :next_frame, :rolls

  def initialize(next_frame)
    @rolls = []
    @next_frame = next_frame
  end

  def spare?
    if regular_points == 10 && !strike?
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

  def regular_points
    points = rolls.reduce(:+)
    points ? points : 0
  end

  def score
    if spare? 
      spare_scoring
    elsif strike? 
      strike_scoring
    else
      @score = regular_points
    end
  end

  private

  def spare_scoring
    if !next_frame.rolls[0].nil?
      @score = regular_points + next_frame.rolls[0]
    else
      @score = regular_points
    end
  end

  def strike_scoring
    if next_frame.class == TenthFrame 
      if next_frame.rolls.size >= 2
        @score = 10 + next_frame.rolls[0,2].reduce(:+)
      else
        @score = regular_points
      end
    elsif next_frame.strike? && next_frame.next_frame.rolls.size >= 1
      @score = 20 + next_frame.next_frame.rolls[0]
    else
      @score = 10 + next_frame.regular_points
    end
  end
end
