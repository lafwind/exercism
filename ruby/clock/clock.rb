class Clock

  def self.at(hour, min = 0)
    time = (hour + min / 60) % 24 * 100 + min % 60
    self.new(time)
  end

  attr_reader :time

  def initialize(time)
    @time = time
  end

  def to_s
    @time.to_s.rjust(4, '0').insert(2, ':')
  end

  def calc(operation, param)
    total_min = (@time / 100) * 60 + @time % 100
    total_min = total_min.send(operation, param)
    total_min = total_min >= 0 ? total_min : (total_min + (24 * 60)).abs
    (total_min / 60) % 24 * 100 + total_min % 60
  end

  def +(inc)
    @time = calc(:+, inc)
    self
  end

  def -(dec)
    @time = calc(:-, dec)
    self
  end

  def == (other_clock)
    @time == other_clock.time
  end
end
