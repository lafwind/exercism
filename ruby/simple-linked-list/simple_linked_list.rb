class Element
  attr_accessor :datum, :next

  def initialize(datum , next_ele)
    @datum, @next = datum, next_ele
  end

  def self.to_a(list_node)
    list_node.to_a
  end

  def self.from_a(arg)
    rst = arg.to_a.map { |node| Element.new(node, nil) }

    rst = rst.map.with_index do |node, idx|
      node.next = rst[idx + 1] unless node.nil?
      node
    end.first

    def rst.reverse
      rst = rst.nil? ? nil : self.reverse
    end
    rst
  end

  def reverse
    reverse_list = self.to_a.reverse
    Element.from_a(reverse_list)
  end

  def to_a
    rst, list_node = [], self
    while !list_node.nil?
      rst << list_node.datum
      list_node = list_node.next
    end
    rst
  end
end
