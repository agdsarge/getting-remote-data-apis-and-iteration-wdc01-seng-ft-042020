def welcome
  # puts out a welcome message here!
  puts "Welcome!"
end

def get_character_from_user
  puts "please enter a character name"
  character = gets.chomp
  if character.empty?
      get_character_from_user
  else
      character.downcase!
      character.gsub(" ", "+")
  end

  # use gets to capture the user's input. This method should return that input, downcased.
end
