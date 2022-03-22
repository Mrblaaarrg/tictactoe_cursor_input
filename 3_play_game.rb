require_relative "2_game"

games = []

games << Game.new

games.last.play

stop = false
until stop
    puts "Play again? y/n"
    response = gets.chomp
    if response.upcase == "Y"
        games << Game.new
        games.last.play
    else
        puts "Goodbye!"
        puts
        p games
        stop = true
    end
end