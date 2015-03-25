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

  # more tests go here
end
