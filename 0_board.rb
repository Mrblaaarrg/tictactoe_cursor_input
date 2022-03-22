class Board
    def initialize(size, winning_score)
        @grid = Array.new(size) { Array.new(size,"--") }
        @winning_score = winning_score
        @legal_positions = []
        (0...size).each do |row|
            (0...size).each do |col|
                @legal_positions << [row, col]
            end
        end
    end

    attr_reader :grid, :legal_positions

    def valid?(pos)
        return false if pos.nil?
        row = pos[0]
        col = pos[1]
        # Invalid if out of bounds
        if row > (@grid.length - 1) || col > (@grid.first.length - 1)
            puts "Position out of bounds"
            return false
        end
        # Invalid if negative coords
        if row < 0 || col < 0
            puts "Position out of bounds"
            return false
        end
        return !@grid[row][col].nil?
    end

    def place_mark(pos, mark)
        row = pos[0]
        col = pos[1]
        @grid[row][col] = mark
        @legal_positions.delete(pos)
    end

    def print
        grid.each { |row| puts row.join(" ") }
    end

    def win_row?(mark)
        @grid.any? { |row| row.join("").include?(mark.to_s * @winning_score) }
    end

    def win_col?(mark)
        @grid
            .transpose
            .any? { |row| row.join("").include?(mark.to_s * @winning_score) }
    end

    def win_diagonal?(mark)
        # Check downward diagonal
        downward = (0..grid.length - 1)
            .map { |i| @grid[i][i] }
            .join("").include?(mark.to_s * @winning_score)

        # Check upward diagonal
        reversed = @grid.map { |row| row.reverse }
        upward = (0..grid.length - 1)            
            .map { |i| reversed[i][i] }
            .join("").include?(mark.to_s * @winning_score)

        return downward || upward
    end

    def win?(mark)
        self.win_row?(mark) || self.win_col?(mark) || self.win_diagonal?(mark)
    end

    def empty_positions?
        @grid
            .flatten
            .any? { |slot| slot == "--" }
    end
end