class Acronym
  VERSION = 1

  def self.abbreviate(given)
    given.split(%r{[^A-za-z]}).map do |word|
      word == word.upcase ? word.capitalize : word[0].upcase + word[1..-1]
    end.join.gsub(/[^A-Z]/, '')
  end
end
