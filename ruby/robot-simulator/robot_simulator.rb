class Robot
  Directions = [:west, :north, :east, :south]

  attr_accessor :direction, :location
  alias_method :bearing, :direction
  alias_method :coordinates, :location

  def initialize
    @direction = nil
    @location = []
  end

  def orient(direction)
     if Directions.include?(direction)
       @direction = direction
     else
       raise ArgumentError
     end
  end

  def turn_right
    @direction =  Directions.at((Directions.index(direction) + 1) % 4)
  end

  def turn_left
    @direction =  Directions.at(Directions.index(direction) - 1)
  end

  def at(location_x, location_y)
    @location = [location_x, location_y]
  end

  def advance
    case @direction
    when :east then
      x = @location.shift
      @location.unshift(x + 1)
    when :west then
      x = @location.shift
      @location.unshift(x - 1)
    when :south then
      y = @location.pop
      @location.push(y - 1)
    when :north then
      y = @location.pop
      @location.push(y + 1)
    else raise ArgumentError
    end
  end
end

class Simulator
  Instrucions = { 'L' => :turn_left, 'R' => :turn_right, 'A' => :advance }

  def instructions(insts)
    insts.chars.map { |inst| Instrucions[inst] }
  end

  def place(robot, location_info)
    robot.location = [location_info[:x], location_info[:y]]
    robot.direction = location_info[:direction]
  end

  def evaluate(robot, insts)
    instructions(insts).each do |inst|
      robot.send(inst)
    end
  end
end
