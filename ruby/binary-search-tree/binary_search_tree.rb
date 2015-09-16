class Bst
  def initialize(node)
    @bst = Array.new()
    @bst[1], @index = node, 1
  end

  def data
    data = @bst[@index]
    @index = 1
    data
  end

  def left
    @index *= 2
    self
  end

  def right
    @index = @index * 2 + 1
    self
  end

  def insert(new_node)
    idx = @index
    until @bst[idx] == nil
      idx = new_node > @bst[idx] ? idx * 2 + 1 : idx * 2
    end
    @bst[idx] = new_node
  end

  def inorder_traversal
    stack, rst, idx = [], [], @index

    while @bst[idx] != nil || !stack.empty?
      if @bst[idx] != nil
        stack.push(idx)
        idx = idx * 2
      else
        idx = stack.last * 2 + 1
        rst << @bst[stack.pop]
      end
    end

    rst
  end

  def each
    self.inorder_traversal.each { |e| yield(e) }
  end
end
