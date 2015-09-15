class Anagram
  def initialize (str)
    @str = str
  end

  def match(arr)
    arr.select do |ele|
      ele.downcase.chars.sort.join == @str.downcase.chars.sort.join &&
        ele.downcase != @str.downcase
    end
  end
end
