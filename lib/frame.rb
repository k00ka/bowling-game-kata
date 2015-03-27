require 'tenth_frame'

class Frame

  # create forward-linked list (for Frame) in an array (for BowlingGame)
  def self.create_frames
    frames = []
    frames.unshift(TenthFrame.new(frames.first))
    9.times { frames.unshift(Frame.new(frames.first)) }
    frames
  end

  def roll(pin_count)
    @rolls << pin_count
  end

  def score
    if strike? || spare?
      pin_count_from_rolls(3)
    else
      pin_count_from_this_frame
    end
  end

  # this is useful for scoring open frames
  def pin_count_from_this_frame
    @rolls.reduce(:+) || 0
  end

  # this is useful for scoring strikes and spares (it transcends frames)
  def pin_count_from_rolls(count)
    return 0 if @rolls.empty?
    my_rolls = [@rolls.length, count].min
    pins = @rolls.first(my_rolls).reduce(&:+)
    if count > my_rolls
      pins += @next_frame.pin_count_from_rolls(count - my_rolls)
    end
    pins
  end

  def strike?
    @rolls.first == 10
  end

  def spare?
    @rolls.length > 1 && pin_count_from_rolls(2) == 10
  end

  def bowled?
    @rolls.length > 1 || strike?
  end

  def rolls_inspect
    if spare?
      "#{@rolls[0]} /"
    else
      @rolls.join(" ").gsub(/10/, "X")
    end
  end

protected
  # use Frame.create_frames outside of this class
  def initialize(next_frame)
    @next_frame = next_frame
    @rolls = []
  end

end
