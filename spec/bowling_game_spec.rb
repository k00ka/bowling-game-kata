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

  it 'knows the score is 1 for 1 pin knocked down' do
    game.roll(1)
    expect(game.score).to eql(1)
  end

  it 'knows the score is 10 for 10 pin knocked down' do
    game.roll(10)
    expect(game.score).to eql(10)
  end

  it 'knows the score is 4 for a roll of 1 and a roll of 4' do
    game.roll(4)
    game.roll(2)
    expect(game.score).to eql(6)
  end

  it 'knows the score is 4 for a roll of 1 and a roll of 4' do
    game.roll(5)
    game.roll(4)
    game.roll(5)
    expect(game.score).to eql(14)
  end

  it 'knows the score is 4 for a roll of 1 and a roll of 4' do
    game.roll(5)
    game.roll(5)
    game.roll(5)
    expect(game.score).to eql(20)
  end

  it 'knows the score is 25 for rolls of 2,3,4,6,5' do
    game.roll(2)
    game.roll(3)
    game.roll(4)
    game.roll(6)
    game.roll(5)
    expect(game.score).to eql(25)
  end

  it 'knows the score is 40 for rolls of 2,3,4,6,5,5,5' do
    game.roll(2)
    game.roll(3)
    game.roll(4)
    game.roll(6)
    game.roll(5)
    game.roll(5)
    game.roll(5)
    expect(game.score).to eql(40)
  end

  it 'knows the score is 24 for rolls of 10,4,3' do
    game.roll(10)
    game.roll(4)
    game.roll(3)
    expect(game.score).to eql(24)
  end

  it 'knows the score is 40 for rolls of 10,4,3,10,2,1' do
    game.roll(10)
    game.roll(4)
    game.roll(3)
    game.roll(10)
    game.roll(2)
    game.roll(1)
    expect(game.score).to eql(40)
  end

  it 'knows the score is 40 for rolls of 10,4,3,10,2,1' do
    game.roll(10)
    game.roll(10)
    game.roll(4)
    game.roll(2)
    expect(game.score).to eql(46)
  end
end
