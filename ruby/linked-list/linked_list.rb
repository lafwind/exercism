class Element
  attr_accessor :prev, :next
  attr_reader :data

  def initialize(data, prev_ele, next_ele)
    @data = data
    @prev = prev_ele || self
    @next = next_ele || self
  end
end

class Deque
  def initialize
    @deque = Element.new(0, nil, nil)
  end

  def set_new_element(new_ele)
    new_ele = Element.new(new_ele, nil, nil)
    new_ele.next = @deque.next == @deque ? new_ele : @deque.next
    new_ele.prev = @deque.prev == @deque ? new_ele : @deque.prev
    new_ele
  end

  def push(ele)
    new_ele = set_new_element(ele)
    @deque.prev.next = new_ele
    @deque.prev = new_ele
    @deque.next = new_ele if @deque.next == @deque
  end

  def pop
    last = @deque.prev
    @deque.prev = last.prev
    last.prev.next = last.prev
    last.data
  end

  def unshift(ele)
    new_ele = set_new_element(ele)
    @deque.next.prev = new_ele
    @deque.next = new_ele
    @deque.prev = new_ele if @deque.prev == @deque
  end

  def shift
    first = @deque.next
    @deque.next = first.next
    first.next.prev = @deque
    first.data
  end
end
