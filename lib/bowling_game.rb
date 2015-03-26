require 'frame'
class BowlingGame
  def initialize
    @score = 0
    @frames = []
    9.downto(0) do |n|
      @frames[n] = Frame.new(@frames[n+1]) 
    end
  end

  def roll(pins_knocked_down)
    @frames.each do |frame| 
      if frame.has_more_rolls?
        frame.rolls << pins_knocked_down
        break
      end
    end
  end

  def score
    @frames.each do |frame|
      @score += frame.score
    end
    @score
  end

private

end


