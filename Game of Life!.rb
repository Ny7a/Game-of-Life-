gridsize = 5
grid = Array.new(gridsize){ Array.new(gridsize){"-"}}
grid[2][1] = "0"
grid[2][2] = "0"
grid[2][3] = "0"

new_grid = Array.new(gridsize){Array.new(gridsize){"-"}}

#print initial grid
(0...gridsize).each do |row|
    (0...gridsize).each do |column|
        print grid[row][column]
        print " "
    end
    puts
end

#loop to scan through grid
(0...gridsize).each do |row|
    (0...gridsize).each do |column|
        live_counter = 0
        if row - 1 >= 0 && grid[row - 1][column] == "0"
            live_counter += 1
        end
        if row - 1 >= 0 && column - 1 >= 0 && grid[row - 1][column - 1] == "0"
            live_counter += 1
        end
        if row - 1 >= 0 && column + 1 < gridsize && grid[row -1][column + 1] == "0"
            live_counter += 1
        end
        if column - 1 >= 0 && grid[row][column - 1] == "0"
            live_counter += 1
        end
        if column + 1 < gridsize && grid[row][column + 1] == "0"
            live_counter += 1
        end
        if row + 1 < gridsize && grid[row + 1][column] == "0"
            live_counter += 1
        end
        if row + 1 < gridsize && column - 1 >= 0 && grid[row + 1][column - 1] == "0"
            live_counter += 1
        end
        if row + 1 < gridsize && column + 1 < gridsize && grid[row + 1][column + 1] == "0"
            live_counter += 1
        end
        
        # change values in new grid
        if live_counter == 3
            new_grid [row][column] = "0"
        elsif live_counter == 2 && grid [row][column] == "0"
            new_grid [row][column] = "0"
        else
            new_grid [row][column] = "-"
        end
    end 
end
puts

#print second grid
(0...gridsize).each do |row|
    (0...gridsize).each do |column|
        print new_grid[row][column]
        print " "
    end
    puts
end
puts
