module Isogram
  def self.isogram?(input)
    # scan returns an array containing the elements that matches the pattern. 
    # \w stands for "word character", usually [A-Za-z0-9_]. 
    # Notice the inclusion of the underscore and digits. It will not work if input == "six_year_old" for example
    # "six-year-old" ->  "sixyearold"
    # "six_year_old" ->  "six_year_old"
    letters = input.downcase.scan(/\w/)
    
    # uniq returns a new array by removing duplicate values in self. 
    # ex: eleven -> elvn
    # Here we are comparing [e, l, e, v, e, n] with [e, l, v, n]
    letters == letters.uniq
  end
end