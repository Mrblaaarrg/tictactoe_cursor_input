require_relative "5_display"

class ComputerPlayer
    def initialize(mark, board)
        @mark = mark
        @display = Display.new(board)
    end

    attr_reader :mark

    def get_position(legal_positions)
        puts "Computer player #{@mark}'s move:"
        pos = legal_positions.sample
        puts "Computer selects #{pos}:"
        return pos
    end
end