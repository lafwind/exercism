class Atbash
  Alpha = [[*'a'..'z'], [*'a'..'z'].reverse]

  def self.encode(string)
    string.gsub(/\W/, '').downcase.chars.map do |char|
      if idx = Alpha.first.index(char)
        Alpha.last[idx]
      else
        char
      end
    end.group_by.with_index do |_, idx|
      idx / 5
    end.values.map { |ele| ele.join }.join(' ')
  end
end
