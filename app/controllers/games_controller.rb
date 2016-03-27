require '..app/controller/cells_controller'
require '..app/view/game_view'

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

  GameController.new
end