require_relative "5_display"

class HumanPlayer
    def initialize(mark, board)
        @mark = mark
        @display = Display.new(board)
    end

    attr_reader :mark, :display

    def get_position(legal_positions)
        result = nil
            until result
                @display.render
                result = @display.get_input
            end
            result
    end
end