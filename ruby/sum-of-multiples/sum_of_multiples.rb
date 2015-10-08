class SumOfMultiples

  def self.to(n)
    [*1..n-1].select { |e| e % 3 == 0 || e % 5 == 0 }.reduce(0, :+)
  end

  def initialize(*args)
    @args =  args
  end

  def to(n)
    [*1..n-1].select do |e|
      @args.inject(false) do |rst, a|
        rst || e % a == 0
      end
    end.reduce(0, :+)
  end
end
