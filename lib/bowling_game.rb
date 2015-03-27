require 'frame'

class BowlingGame

  def initialize
    @frames = Frame.create_frames
    @current_frame = 1
  end

  def roll(pin_count)
    return if @frames[9].bowled? # game over, dude
    @frames[@current_frame-1].roll(pin_count)
    @current_frame += 1 if @frames[@current_frame-1].bowled?
  end

  def score
    @frames.map(&:score).reduce(&:+)
  end

  def frames_inspect
    @frames.map(&:rolls_inspect).join(" | ") + "\n" + @frames.map(&:score).join(" | ")
  end

end
