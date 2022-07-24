module Pangram
ENGLISH_ALPHABET_CHARS = 26
  
  def self.pangram?(sentence)
    letters = sentence.downcase.scan(/[a-z]/).uniq
    letters.length == ENGLISH_ALPHABET_CHARS
  end
end