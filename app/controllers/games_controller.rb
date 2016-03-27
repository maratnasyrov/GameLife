require '..app/controller/cells_controller'
require '..app/view/game_view'

class GamesController
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
  end

  GamesController.new
end