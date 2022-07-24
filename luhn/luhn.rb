module Luhn
  def self.valid?(input)
    even_numbers = []
    odd_numbers = []

    return if !valid_input?(input)

    validated = input.delete(" ").split("")
    validated.reverse!

    validated.each_index do |i| 
      if i.odd?
        doubled = validated[i].to_i * 2
        
        if doubled > 9
          doubled -= 9
        end
      
        odd_numbers.push(doubled) 
      end

      if i.even?
        even_numbers.push(validated[i].to_i)
      end
    end 

    (odd_numbers.sum + even_numbers.sum) % 10 == 0
  end

  private 

  def self.valid_input?(input)
    temp = input
    temp.delete!(" ")
    
    !(temp.length <= 1 ||temp.match(/\D/))
  end
end
  
