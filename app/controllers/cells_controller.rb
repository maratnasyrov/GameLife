require '../app/models/cell'

class CellsController
  attr_accessor :cells, :torus_surface, :live_cells_number, :neighbors_number

  def initialize(cells)
    @cells = cells
    @live_cells_number = 0
    @neighbors_number = 0
  end

  def get_cells
    cells
  end

  def find_live_cells
    live_cells_number = 0

    cells.each_index do |i|
      cells[i].each_index do |j|
        cell = cells[i][j]
        if cell == 1
          live_cells_number += 1
        end
      end
    end
    return live_cells_number
  end

  def configuration(object)
    object.clear

    cells.each_index do |i|
      cells[i].each_index do |j|
        cell = cells[i][j]
        if cell == 1
          object.push(i,j)
        end
      end
    end
    return object
  end

  def live_neighbors(i,j)
    neighbors_number = 0

    [i-1, i, i+1].each do |ind1|
      x = ind1 % cells.size
      [j-1,j, j+1].each do |ind2|
        y = ind2 % cells.size
        if cells[x][y] == 1 && [x,y] != [i,j]
          neighbors_number += 1
        end
      end
    end
    return neighbors_number
  end
end