#Advanced developers: Uncomment the following to understand more about the RSpec "focus" filter
#require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

require 'bowling_game'

# The top of your testing block
# More examples of tests can be found here: https://github.com/rspec/rspec-expectations
RSpec.describe BowlingGame, "#score" do

  let(:game) { BowlingGame.new }

  it "knows the score is 0 for a new game" do
    expect(game.score).to eql(0)
  end

  it "knows a gutter ball on first roll scores 0" do
    game.roll(0)
    expect(game.score).to eql(0)
  end

  it "knows a roll of 1 on first roll scores 1" do
    game.roll(1)
    expect(game.score).to eql(1)
  end

  it "knows a roll of 10 on first roll scores 10" do
    game.roll(10)
    expect(game.score).to eql(10)
  end

  it "knows a roll of 1 and 1 on first two roll scores 2" do
    game.roll(1)
    game.roll(1)
    expect(game.score).to eql(2)
  end

  it "knows a roll of 1 and 1 and 1 on first three roll scores 3" do
    3.times { game.roll(1) }
    expect(game.score).to eql(3)
  end

  it "knows rolls of 8 and 2 and 5 on first three roll scores 20" do
    game.roll(8)
    game.roll(2)
    game.roll(5)
    expect(game.score).to eql(20)
  end

  it "knows rolls of 8 and 2 and 5 and 5 and 6 on first three roll scores 37" do
    game.roll(8)
    game.roll(2)
    game.roll(5)
    game.roll(5)
    game.roll(6)
    expect(game.score).to eql(37)
  end

  it "knows rolls of 10 and 5 on first two roll scores 20" do
    game.roll(10)
    game.roll(5)
    expect(game.score).to eql(20)
  end

  it "knows how to score a whole game" do
    game.roll(7)
    game.roll(3)
    game.roll(8)
    game.roll(2)
    game.roll(7)
    game.roll(2)
    game.roll(9)
    game.roll(1)
    game.roll(10)
    game.roll(10)
    game.roll(10)
    game.roll(2)
    game.roll(3)
    game.roll(6)
    game.roll(4)
    game.roll(7)
    game.roll(3)
    game.roll(3)
    puts; puts game.frames_inspect
    expect(game.score).to eql(166)
  end

  it "knows when a game is over" do
    game.roll(7)
    game.roll(3)
    game.roll(8)
    game.roll(2)
    game.roll(7)
    game.roll(2)
    game.roll(9)
    game.roll(1)
    game.roll(10)
    game.roll(10)
    game.roll(10)
    game.roll(2)
    game.roll(3)
    game.roll(6)
    game.roll(4)
    game.roll(3)
    game.roll(3)
    game.roll(2) # third ball in open tenth frame should be ignored
    puts; puts game.frames_inspect
    expect(game.score).to eql(155)
  end

  it "knows how to score a perfect game" do
    game.roll(10)
    game.roll(10)
    game.roll(10)
    game.roll(10)
    game.roll(10)
    game.roll(10)
    game.roll(10)
    game.roll(10)
    game.roll(10)
    game.roll(10)
    game.roll(10)
    game.roll(10)
    puts; puts game.frames_inspect
    expect(game.score).to eql(300)
  end

  # more tests go here
end
