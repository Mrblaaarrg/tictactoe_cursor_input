require_relative "0_board"
require_relative "1_human_player"
require_relative "1.1_computer_player"

class Game
    def initialize
        puts "Enter board size:"
        size = gets.chomp.to_i
        puts "Enter winning score (up to board size):"
        winning_score = gets.chomp.to_i
        puts "Enter number of human players:"
        human_num_players = gets.chomp.to_i
        puts "Enter number of computer players:"
        computer_num_players = gets.chomp.to_i
        @players = []
        hp = 0
        human_num_players.times do
            hp += 1
            @players << HumanPlayer.new("h" + (hp).to_s)
        end
        cp = 0
        computer_num_players.times do
            cp += 1
            @players << ComputerPlayer.new("c" + (cp).to_s)
        end
        @board = Board.new(size, winning_score)
        @currentPlayer = @players.first
    end

    attr_reader :players, :board, :currentPlayer

    def switch_turn
        @players.rotate!
        @currentPlayer = @players.first
    end

    def playable_position          
        validPos = false
        until validPos
            pos = @currentPlayer.get_position(@board.legal_positions)
            if !@board.valid?(pos)
                puts "Please try again"
                puts
            else
                validPos = @board.valid?(pos)
            end
        end
        return pos
    end

    def play
        puts "Select a position to mark!"
        puts "WASD or arrow keys to move the cursor, enter or space to confirm."

        gameOver = false
        until gameOver
            puts "~~ " * @board.grid.length

            pos = self.playable_position
            puts

            @board.place_mark(pos,currentPlayer.mark)
            @board.print
            puts

            playerWins = @board.win?(currentPlayer.mark)
            if playerWins
                puts "Player #{currentPlayer.mark} WINS!"
                gameOver = true
            elsif !@board.empty_positions?
                puts "TIE!"
                gameOver = true
            end

            self.switch_turn
        end
        puts
        puts "Game over"
        return
    end
end