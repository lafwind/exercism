class BinarySearch
  attr_accessor :list

  def initialize(list)
    raise ArgumentError if list != list.sort
    @list = list
  end

  def search_for(item)
    raise RuntimeError if !list.include?(item)

    start_point, end_point = 0, list.size - 1
    while item != list[middle]
      if item < list[middle]
        end_point = middle - 1
        return BinarySearch.new(list[start_point..end_point]).search_for(item) + start_point
      else
        start_point = middle + 1
        return BinarySearch.new(list[start_point..end_point]).search_for(item) + start_point
      end
    end
    middle
  end

  def middle
    list.size / 2
  end
end
