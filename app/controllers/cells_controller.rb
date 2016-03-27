require '../app/model/cell'

class CellsController

  def initialize(cells)
    @cells = cells
  end

  def get_cells
    cells
  end

  def find_live_cells
  end

  def configuration(object)
  end

  def live_neighbors(i,j)
  end
end