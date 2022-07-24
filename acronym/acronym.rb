# https://ruby-doc.org/stdlib-2.6.1/libdoc/strscan/rdoc/StringScanner.html
# https://regex101.com

# sentence.upcase.scan(/\b[A-Z]/).join
#   \b assert position at a word boundary, in this case, at the beginning of each word 
#   [A-Z] will match ASCII characters in the range from A to Z. 

module Acronym 
  def self.abbreviate(sentence)
    acronym = ""
    
    words = sentence.split(/[^a-zA-Z]/)
    words.each { |word| acronym << word.chr.upcase }
    
    acronym
  end
end

   
