desc 'Run the flog metrics tool on the BowlingGame class'
task :flog do
  system 'flog -agme lib/bowling_game.rb | grep -v lib/bowling_game | tee /dev/tty | pbcopy'
end

desc 'Highlight source code from the clipboard back onto the clipboard (suitable for Keynote)'
task :keynote do
  system 'pbpaste | highlight --out-format rtf --font-size 24 --font Menlo --plug-in highlight/rspec.lua --config-file highlight/twilight.theme --style twilight --src-lang ruby | pbcopy'
end

desc 'Highlight source code from the clipboard back onto the clipboard (suitable for Pages)'
task :pages do
  system 'pbpaste | highlight --out-format rtf --font-size 10 --font Menlo --src-lang ruby --line-numbers | pbcopy'
end

desc 'Run mutation testing to assess the characterization'
task :mutate do
  system 'mutant --include lib --require bowling_game --use rspec .score'
end

desc 'Approve the received characterization'
task :approve do
  mv received, approved
end

private

def received
  characterization_filename :received
end

def approved
  characterization_filename :approved
end

def characterization_filename(status)
  "spec/fixtures/approvals/bowling_game/knows_how_to_score_a_game.#{status}.txt"
end
