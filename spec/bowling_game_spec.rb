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

  it 'knows the score is 6 for |4,2|' do
    game.roll(4)
    game.roll(2)
    expect(game.score).to eql(6)
  end

  it 'knows the score is 14 for rolls of |5,4|5' do
    game.roll(5)
    game.roll(4)
    game.roll(5)
    expect(game.score).to eql(14)
  end

  it 'knows the score is 10 for |5,5| ' do
    game.roll(5)
    game.roll(5)
    expect(game.score).to eql(10)
  end

  it 'knows the score is 20 for |5,5|5 or a spare followed by a 5' do
    game.roll(5)
    game.roll(5)
    game.roll(5)
    expect(game.score).to eql(20)
  end

  it 'knows the score is 25 for 2,3|4,6|5 Can handle spares in between' do
    game.roll(2)
    game.roll(3)
    game.roll(4)
    game.roll(6)
    game.roll(5)
    expect(game.score).to eql(25)
  end

  it 'knows the score is 40 for |2,3|4,6|5,5|5 Can handle consecutive spares' do
    game.roll(2)
    game.roll(3)
    game.roll(4)
    game.roll(6)
    game.roll(5)
    game.roll(5)
    game.roll(5)
    expect(game.score).to eql(40)
  end

  it 'knows the score is 24 for |10|4,3| Or a strike followed by 4,3' do
    game.roll(10)
    game.roll(4)
    game.roll(3)
    expect(game.score).to eql(24)
  end

  it 'knows the score is 40 for |10|4,3|10|2,1| Can handle strikes in between' do
    game.roll(10)
    game.roll(4)
    game.roll(3)
    game.roll(10)
    game.roll(2)
    game.roll(1)
    expect(game.score).to eql(40)
  end

  it 'knows the score is 40 for |10|10|4,2| Can handle consecutive strikes' do
    game.roll(10)
    game.roll(10)
    game.roll(4)
    game.roll(2)
    expect(game.score).to eql(46)
  end

  it 'knows the score is 77 for |10|10|10|3,4| Can handle 3 consecutive strikes' do
    game.roll(10)
    game.roll(10)
    game.roll(10)
    game.roll(3)
    game.roll(4)
    expect(game.score).to eql(77)
  end

  it 'knows the score is 85 9*|5,4| and |3,1| The 10th behaves like a normal frame if open' do
    9.times do
      game.roll(5)
      game.roll(4)
    end 

    game.roll(3)
    game.roll(1)
    expect(game.score).to eql(85)
  end

  it 'knows the score is 96 for 9x|5,4| and |5,5,5| The 10th frame add one additional roll if spare' do
    9.times do
      game.roll(5)
      game.roll(4)
    end 

    game.roll(5)
    game.roll(5)
    game.roll(5)
    expect(game.score).to eql(96)
  end

  it 'knows the score is 101 if 9x|5,4| and |10,5,5| The 10th frame add one additional roll for strike at the beginning' do
    9.times do
      game.roll(5)
      game.roll(4)
    end 

    game.roll(10)
    game.roll(5)
    game.roll(5)
    expect(game.score).to eql(101)
  end

  it 'knows the score is 106 9x|5,4| and |10,10,5| The 10th frames score is just the sum of the pins knocked down' do
    9.times do
      game.roll(5)
      game.roll(4)
    end 

    game.roll(10)
    game.roll(10)
    game.roll(5)
    expect(game.score).to eql(106)
  end

  it 'knows the score is 11 for 9x|5,4| and |10,10,10| The 10th frames handles three strikes properly' do
    9.times do
      game.roll(5)
      game.roll(4)
    end 

    game.roll(10)
    game.roll(10)
    game.roll(10)
    expect(game.score).to eql(111)
  end

  it 'knows the score is 260 for 10 consecutive strikes. There is no 11th frame.' do
    10.times do 
      game.roll(10)
    end 

    expect(game.score).to eql(260)
  end

  it 'knows the score is 290 for 11 consecutives strikes. The 9th frame adds up the two firsts rolls of 10th' do
    11.times do
      game.roll(10)
    end 

    expect(game.score).to eql(290)
  end


  it 'knows the score is 300 for 12 strikes' do
    12.times do
      game.roll(10)
    end 

    expect(game.score).to eql(300)
  end

  it 'knows that the score is 0 for 20 consutives misses' do
    20.times do
      game.roll(0)
    end 

    expect(game.score).to eql(0)
  end

  it 'gives the right anwser for a real game score' do
    game.roll(10)

    game.roll(9)
    game.roll(1)

    game.roll(5)
    game.roll(5)

    game.roll(7)
    game.roll(2)

    game.roll(10)

    game.roll(10)

    game.roll(10)
    
    game.roll(9)
    game.roll(0)

    game.roll(8)
    game.roll(2)

    game.roll(9)
    game.roll(1)
    game.roll(10)
    expect(game.score).to eql(187)
  end
end
