class Phrase
  VERSION = 1

  def initialize(word)
    @word = word
  end

  def word_count
    arr = @word.gsub(/[^a-zA-Z0-9_']/, ' ').split.map do |e|
      e.start_with?("'") ? e[1..-2].downcase : e.downcase
    end

    arr.map do |w|
      [w, arr.count(w)]
    end.to_h
  end
end
