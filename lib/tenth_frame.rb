class Frame
end

class TenthFrame < Frame

  # you get three balls in 10th frame, but only if you strike or spare
  def bowled?
    (@rolls.length == 2 && pin_count_from_rolls(2) < 10) || @rolls.length == 3
  end

  def pin_count_from_rolls(count)
    return 0 if @rolls.empty?
    @rolls.first(count).reduce(&:+)
  end
  
  # add the third roll to the first two
  def rolls_inspect
    if spare?
      "#{@rolls[0]} / #{@rolls[2]}"
    else
      super
    end
  end

end
