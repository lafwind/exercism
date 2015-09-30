class CircularBuffer
  class BufferEmptyException < Exception; end
  class BufferFullException < Exception; end

  def initialize(size)
    @buf_size = size
    @buffer = []
    clear
  end

  def write_update(ele)
    @buffer[@write_point] = ele
    @write_point = (@write_point + 1) % @buf_size
    @now_size += 1
  end

  def write(ele)
    raise BufferFullException if @now_size >= @buf_size
    write_update(ele) unless ele.nil?
  end

  def write!(ele)
    unless ele.nil?
      if @now_size == @buf_size
        @read_point = (@read_point + 1) % @buf_size
        @now_size -= 1
      end
      write_update(ele)
    end
  end

  def read
    raise BufferEmptyException if @now_size == 0
    @read_point = (@read_point + 1) % @buf_size
    @now_size -= 1
    @buffer[@read_point]
  end

  def clear
    @now_size = 0
    @read_point, @write_point = -1, 0
  end
end
