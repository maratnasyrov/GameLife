require '../controllers/cells_controller'
require '../views/game_view'

class GameController
  def initialize
    start_game
  end

  private

  def open_file
    begin
      file = File.open('input.txt').map do |line|
        line.split(' ')
      end
      return file
    rescue => err
      puts "Exception: #{err}"
      err
    end
  end

  def start_game
    GameView.display_message_start_game

    world = create_world(open_file)
    starting_life(world)
  end

  def create_world(open_file)
    torus_surface = Array.new(5).map!{Array.new(5)}
    ind_cells = 0
    torus_surface.each_index do |i|
      torus_surface[i].each_index do |j|
        cell = Cell.new.set_status(open_file[ind_cells].to_s.delete('[""]').to_i)
        torus_surface[i][j] = cell
        ind_cells += 1
      end
    end
    GameView.display_array(torus_surface)
    return torus_surface
  end

  def starting_life(cells)
    cells = CellsController.new(cells)
    live_cells = cells.find_live_cells
    cells_replay = Array.new
    current_configuration = Array.new
    last_configuration = Array.new

    while live_cells > 0 && !cells_replay.include?(cells.configuration(current_configuration)) do
      sleep 2
      system('clear')

      evolution = Array.new(5).map!{Array.new(5)}
      cells_array = cells.get_cells

      cells_array.each_index do |i|
        cells_array[i].each_index do |j|
          number = cells.live_neighbors(i,j)
          if number == 3
            evolution[i][j] = 1
          elsif number < 2 || number > 3
            evolution[i][j] = 0
          else
            evolution[i][j] = cells_array[i][j]
          end
        end
      end

      last = cells.configuration(last_configuration).clone
      cells_replay.push(last)
      cells_array = evolution
      @evolution = cells_array
      cells = CellsController.new(evolution)

      GameView.display_number_iteration(cells_replay.size)
      GameView.display_number_live_cells(live_cells)
      GameView.display_array(cells_array)

      live_cells = cells.find_live_cells
    end

    GameView.display_message_end_game(live_cells, cells_replay.size)
  end

  GameController.new
end