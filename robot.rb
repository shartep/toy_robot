class Robot
  FACING = {north: 0, east: 1, south: 2, west: 3}
  TABLE_SIZE = 4

  def initialize
    @x = 0
    @y = 0
    @f = :north
    @placed = false
  end

  def place(in_x, in_y, in_f)
    in_x = in_x.to_i
    in_y = in_y.to_i
    in_f = in_f.downcase.to_sym

    if (0..TABLE_SIZE).include?(in_x) &&
        (0..TABLE_SIZE).include?(in_y) &&
        FACING[in_f]
      @x = in_x.to_i
      @y = in_y.to_i
      @f = in_f
      @placed = true
    end
  end

  def left
    if @placed
      @f == :north ? @f = :west : @f = FACING.key(FACING[@f] - 1)
    end
  end

  def right
    if @placed
      @f == :west ? @f = :north : @f = FACING.key(FACING[@f] + 1)
    end
  end

  def move
    if @placed
      if @f == :north && @y != TABLE_SIZE
        @y += 1
      elsif @f == :east && @x != TABLE_SIZE
        @x += 1
      elsif @f == :south && @y != 0
        @y -= 1
      elsif @f == :west && @x != 0
        @x -= 1
      end
    end
  end

  def report
    "#{@x},#{@y},#{@f.to_s.upcase}" if @placed
  end
end
