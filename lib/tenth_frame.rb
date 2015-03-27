class TenthFrame
  attr_reader :rolls

  def initialize
    @rolls = []
  end

  def spare?
    if rolls.size >= 2 && (rolls[0] + rolls[1]) == 10
      true
    else
      false
    end
  end

  def strike?
    if rolls[0] == 10 || rolls[1] == 10 
      true
    else
      false
    end
  end

  def has_more_rolls?
    if !spare? && !strike? && rolls.size == 2 
      false
    elsif rolls.size == 3
      false
    else
      true
    end
  end

  def score
    points = rolls.reduce(:+)
    points ? points : 0
  end
end
