require_relative "2_game"

games = []

puts "Enter board size:"
size = gets.chomp.to_i
puts "Enter winning score (up to board size):"
winning_score = gets.chomp.to_i
puts "Enter number of human players:"
human_num_players = gets.chomp.to_i
puts "Enter number of computer players:"
computer_num_players = gets.chomp.to_i

games << Game.new(size, winning_score, human_num_players, computer_num_players)

games.last.play

stop = false
until stop
    puts "Play again? y/n"
    response = gets.chomp
    if response.upcase == "Y"
        games << Game.new(size, winning_score, human_num_players, computer_num_players)
        games.last.play
    else
        puts "Goodbye!"
        puts
        p games
        stop = true
    end
end