class CustomSet
  attr_accessor :set

  def initialize(arg_set = [])
    @set = arg_set.to_a.uniq.sort
  end

  def delete(ele)
    @set.delete(ele) if @set.include?(ele) && @set[@set.index(ele)].class == ele.class
    self
  end

  def ==(other)
    @set == other.set
  end

  def difference(other)
    @set = set - other.set
    self
  end

  def disjoint?(other)
    @set.size == (@set - other.set).size
  end

  def empty
    @set.clear
    self
  end

  def intersection(other)
    @set = set & other.set
    self
  end

  def member?(ele)
    @set.include?(ele) && @set[@set.index(ele)].class == ele.class
  end

  def subset?(other)
    (other.set - @set).size == 0
  end

  def size
    @set.size
  end

  def to_a
    @set
  end

  def put(ele)
    @set = (@set << ele).sort unless member?(ele)
    self
  end

  def union(other)
    @set = (@set + other.set).uniq.sort
    self
  end
end
