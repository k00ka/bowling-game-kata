require 'frame'
class BowlingGame
  def initialize
    @score = 0
    @frames = []
    9.downto(0) do |n|
      @frames[n] = Frame.new(@frames[n+1]) 
    end
    @current_frame = @frames[0] 
  end

  def roll(pins_knocked_down)
    @current_frame = @current_frame.next_frame unless @current_frame.has_more_rolls?
    @current_frame.rolls << pins_knocked_down
  end

  def score
    @frames.each do |frame|
      @score += frame.score
    end
    @score
  end

private

end


