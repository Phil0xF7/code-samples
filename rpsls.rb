#
# Rock, Paper, Scissors, Lizard, Spock
#

# this matrix shows the winning results as it relates to the user
truth_table = [
  0, -1, 1, 1, -1, 
  1, 0, -1, -1, 1,
  -1, 1, 0, 1, -1,
  -1, 1, -1, 0, 1,
  1, -1, 1, -1, 0
]

# options for the game
options = ['rock', 'paper', 'scissors', 'lizard', 'spock']

# prompt user for choice
user_choice = ''
while options.index(user_choice).nil?
  print "Make your choice (Rock, Paper, Scissors, Lizard, Spock): "
  user_choice = gets.chomp.downcase

  if options.index(user_choice).nil?
    puts "Invalid selection, please try again"
  else
    break
  end
end

# computer chooses
comp_choice = options.sample

# determine winner
row = options.index(user_choice)
col = options.index(comp_choice)
result = truth_table[row * 5 + col]

puts "Computer chooses #{comp_choice.capitalize}"

# display results
case result
  when 0
    puts "#{user_choice.capitalize} ties with #{comp_choice.capitalize}, it's a TIE!"
  when 1
    puts "#{user_choice.capitalize} beats #{comp_choice.capitalize}, you WIN!"
  when -1
    puts "#{comp_choice.capitalize} beats #{user_choice.capitalize}, you LOSE!"
  else
    puts "Something very wrong just happened!"
end
