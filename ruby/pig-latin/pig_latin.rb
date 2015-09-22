class PigLatin
  Part_Of_Vowel = ['a', 'e', 'i', 'o']

  def self.translate(string)
    string.split.map { |word| word_translate(word) }.join(' ')
  end

  def self.word_translate(word)
    rst, start = word.chars, 0

    rst.each_with_index do |char, idx|
      if Part_Of_Vowel.include?(char) ||
         (char == 'u' && rst.last != 'q') ||
         (char == 'y' && rst[idx + 1] == 't') ||
         (char == 'x' && rst[idx + 1] == 'r')
        start = idx
        break
      else
        rst << char
      end
    end
    rst[start.. -1].join << "ay"
  end
end
