Bowling Game Kata TDD Workshop
==============================

This repo contains an exercise for the fifth Ruby Hack Night workshop presented by me, David Andrews. This workshop is about full-scale TDD, integrating all of the ideas presented in the first four workshops. For this session I have chosen to base our activities on Uncle Bob's Bowling Game kata.

I've restructured the repository to provide a quick-start to TDD with RSpec and to mimic the setup we used in several of the previous workshops. The code to be created is found in the ``lib/`` directory, and I have supplied a start to the unit tests in the ``spec/`` directory.

###Setup

Here are the steps to get you started with the repo. We assume, naturally, that you have a working development machine with Ruby 1.9 or better on it. At Ryatta Group we use rbenv, and so we've included some optional elements - just skip them if you're using rvm or are not versioning your Ruby.

```sh
% git clone git@github.com:k00ka/bowling-game-kata.git
% cd bowling-game-kata
% gem install bundler
Fetching: bundler-1.7.4.gem (100%)
Successfully installed bundler-1.7.4
1 gem installed
% bundle
Fetching gem metadata from https://rubygems.org/.........
Resolving dependencies...
Installing rake 10.3.2
...
Using bundler 1.7.4
Your bundle is complete!
Use `bundle show [gemname]` to see where a bundled gem is installed.
```
######Note: if you use rbenv...
```sh
% rbenv rehash
```
You are (almost) there!

###TDD
If you want to learn (more) about TDD, there are plenty of online resources. For a quick primer, you can review our blog post from the previous workshop: [http://www.ryatta.com/refactoring-in-context/]

Tonight (or below if you're doing this kata on your own), I’m going to give you some directions for what your solution should do. In response to these requests, you are going to:

1. Focus on one specification at a time. Do not read ahead.
2. Implement the test(s) in spec/bowling_game_spec.rb.
3. Run "rspec" from the project root and watch the new test(s) fail.
4. Implement the simplest possible change to lib/bowling_game.rb to make the code work. Don't refactor.
5. Check that the tests pass.
6. Commit your new code.
7. Refactor the code with the focus on simplifying it (refactor but try not to change the scope of functionality).
8. Check that the tests still pass.
9. Commit your revision.
10. Start again with a new requirement.

We'll iterate on this pattern so you can practice the full TDD workflow.

####Tips
* Implement the simplest code you can imagine to make the tests pass.
* Once the tests pass, refactor the code to simplify it.
* Let earlier tests stand, they will catch regressions.
* Discuss edge cases and obscure aspects with the customer or others on your team.

###How to test

There is an mostly empty file in the ``lib/`` directory. It is called ``bowling_game.rb``. This is part 1 of your deliverable.

There is a unit test file in the ``spec/`` directory called ``bowling_game_spec.rb``. This is part 2 of your deliverable.

To "pass the Bowling Game Kata", you need to make both files work together.
To run the tests we have written against the code we've developed, do the following:
```sh
%rspec
F

Failures:

  1) BowlingGame#score the score is 0 for a new game
     Failure/Error: expect(game.score).to eql(0)
       
       expected: 0
            got: nil
       
       (compared using eql?)
     # ./spec/bowling_game_spec.rb:13:in `block (2 levels) in <top (required)>'

Finished in 0.00088 seconds (files took 0.09068 seconds to load)
1 example, 1 failure

Failed examples:

rspec ./spec/bowling_game_spec.rb:12 # BowlingGame#score the score is 0 for a new game
```

The text ``1 failure`` means you're currently "failing the Bowling Game Kata"! Now go fix some code and share what you've learned with the group.

###The Exercise
Carefully follow the TDD workflow described above. The focus should be on learning the workflow, not how clever you can be with the code. Try not to write generalized solutions, but focus on the simplest, minimal code for each requirement. The point is to focus on minimalism, not on projecting general solutions.

####Scoring Basics
One game of bowling consists of 10 frames, with a minimum score of zero and a maximum of 300. Each frame consists of two chances to knock down 10 pins. Pins are points.

If, after two shots in a frame, at least one pin is still standing, it’s called an open frame. Open frames are taken at face value, your score is the sum of the pins knocked down.

####Implement Basic Scoring
At this point we know that:
1. a game consists of 10 frames with 2 rolls each, so twenty chances to score points
2. A game is simply the sum of the pin counts

Let’s talk about:
* Modelling
* Testing
* Implementing
* Refactoring


####Strikes and Spares
Strikes and spares can be worth more points than the count of pins knocked down. 

Knocking down all 10 pins on your first ball in a frame is called a strike, denoted by an “X” on the score sheet. If it takes two shots to knock down all 10 pins, it’s called a spare, denoted by a “/” on the score sheet. If neither of these happens, it’s an open frame.

####Scoring a Spare
A spare is worth 10, plus the value of your next roll. 

Say you throw a spare in the first frame. Technically, you don't have a score yet, but you know it’s at least 10. You need to throw another ball to figure out your total score for that frame. In the second frame, if you knock down 5 pins on the first ball, your score is (10 + 5) + (5). If you then knock down 3 more, your score is (10 + 5) + (5 + 3). The 5 counts twice!

####*Focus on Frames* for Scoring
Many people understand the basics but get confused when trying to add everything up. Your total score is nothing more than the sum of each individual frame. If you treat each frame individually, it's much easier to comprehend the scoring system.

####Implement Spare Scoring
Considering spares, a game still consists of twenty rolls of the ball. 

A game is no longer simply the sum of the pin counts, but something a little more complicated. 

Let’s talk about:
* Modelling
* Testing
* Implementing
* Refactoring

####Scoring a Strike
A strike is worth 10, plus the value of your next two rolls. 

Say you throw a strike in the first frame. Technically, you don't have a score yet, but you know it’s at least 10. You need to throw two more balls to figure out your total score for that frame. In the second frame, if you knock down 6 pins on the first ball, your score is at least (10 + 6) + (6). If you then knock down 2 more, your score is (10 + 6 + 2) + (6 + 2). The 6 + 2 count twice.

Gotcha: If you roll two strikes in a row, the first will double-count the rolls in the next two frames!

####Implement Strike Scoring
Considering strikes, a game consists of twenty or less rolls of the ball (it doesn’t seem fair that someone doing well gets less scoring chances!) 

Considering strikes, game scoring is much more complicated.

Let’s talk about:
* Modelling (how is it holding up?)
* Testing
* Implementing
* Refactoring

####The Tenth Frame
Sounds like a good name for a bowling pub! 

The tenth frame is special:
* all bowlers get to roll three balls in all cases
* strikes or spares cause all of the pins to be reset mid-frame
* The usual scoring rules apply

####Implement the Tenth Frame Scoring
Considering the tenth frame, a game consists of twenty-one or less rolls of the ball

With the tenth frame, game scoring is much, much more complicated

Let’s talk about:
* Modelling
* Testing (how to do this easily?)
* Implementing
* Refactoring
