require_relative "5_display"

class ComputerPlayer < HumanPlayer

    def get_position(legal_positions)
        puts "Computer player #{@mark}'s move:"
        pos = legal_positions.sample
        puts "Computer selects #{pos}:"
        sleep(1)
        return pos
    end
end