class Proverb
  def initialize(*args)
    @args = args
    @qualifier = args.last.is_a?(Hash) ? args.pop[:qualifier] + " " : ""
  end

  def to_s
    lines = @args[0..-2].zip(@args[1..-1])

    rst = lines.map do |first, last|
      "For want of a #{first} the #{last} was lost."
    end.join("\n")

    rst += "\nAnd all for the want of a #{@qualifier}#{@args[0]}."
  end

end
