def move(state)
  head = state[:you][:body][0]
  neck = state[:you][:body][1]
  moves = ['up', 'down', 'left', 'right']

  moves.each do |move|
    coord = move_as_coord(move, head)
    if !off_board(state, coord) && !coord_equal(coord, neck)
      return { move: move }
    end
  end
  { move: 'up' }
end


def coord_equal(a, b)
  a[:x] === b[:x] && a[:y] === b[:y]
end

def move_as_coord(move, head)
  case move
  when 'up'
    { x: head[:x], y: head[:y]-1 }
  when 'down'
    { x: head[:x], y: head[:y]+1 }
  when 'left'
    { x: head[:x]-1, y: head[:y] }
  when 'right'
    { x: head[:x]+1, y: head[:y] }
  end
end

def off_board(state, coord)
  return true if coord[:x] < 0
  return true if coord[:y] < 0
  return true if coord[:y] >= state[:board][:height]
  return true if coord[:x] >= state[:board][:height]
  return false # If it makes it here we are ok.
end
