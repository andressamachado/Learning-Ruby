class Anagram

  def initialize(input)
    @input = input
  end

  def match(words_to_check)
    anagrams = []

    words_to_check.each do |word|
      next if word.downcase == @input.downcase

      if word.downcase.chars.sort.join == @input.downcase.chars.sort.join
        anagrams << word
      end
    end
  
    anagrams
  end
end