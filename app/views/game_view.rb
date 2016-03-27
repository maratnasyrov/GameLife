module GameView
  class << self
    def display_array(array)
      array.each_index do |i|
        print '     '
        array[i].each_index do |j|
          print "#{array[i][j]} "
        end
        puts
      end
      puts
    end

    def display_message_start_game
      print "Game start!\n"
    end

    def display_number_iteration(number)
      print "Number of iterations: #{number}\n"
    end

    def display_number_live_cells(number)
      print "Number of live cells: #{number}\n"
    end

    def display_message_end_game(number_live_cells, number_iteration)
      if number_live_cells != 0
        print "Met the same configuration. Game ended\n"
      else
        print "All cells died! =( \n"
      end
      display_number_iteration(number_iteration)
    end
  end
end