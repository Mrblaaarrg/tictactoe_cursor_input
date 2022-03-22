class HumanPlayer
    def initialize(mark)
        @mark = mark
    end

    attr_reader :mark

    def get_position(legal_positions)
        puts "Player #{@mark}'s move:"
        puts "Enter a position, in a 'row,column' format. Should only contain two numbers separated by a comma:"
        input = gets.chomp
        abc = ("a".."z").to_a
        # Invalid if letters in the position
        input.each_char do |ch|
            if abc.include?(ch)
                puts "Invalid position! Should not include letters"
                return nil
            end
        end
        # Invalid if given more than two coords
        if input.split(",").length != 2
            puts "Invalid position! Should provide two noumbers separated by a comma, ex: 0,2"
            return nil
        end
        position = input
            .split(",")
            .map(&:to_i)

        if !legal_positions.include?(position)
            puts "Illegal position, either out of bounds or already occupied"
            return nil
        end

        return position
    end
end