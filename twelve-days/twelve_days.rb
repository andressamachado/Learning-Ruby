
module TwelveDays
  GIFTS = ['Partridge in a Pear Tree', 'Turtle Doves', 'French Hens', 'Calling Birds', 'Gold Rings', 'Geese-a-Laying', 'Swans-a-Swimming', 'Maids-a-Milking', 'Ladies Dancing', 'Lords-a-Leaping', 'Pipers Piping', 'Drummers Drumming' ]
  DAYS = ['first', 'second', 'third', 'fourth', 'fifth', 'sixth', 'seventh', 'eighth', 'ninth', 'tenth', 'eleventh', 'twelfth']
  COUNT = ['a', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine', 'ten', 'eleven', 'twelve']
    
  def self.song
    song = []

    DAYS.each_index do |i| 
      day = "On the #{DAYS[i]} day of Christmas my true love gave to me: "
      
      counter = i
        while counter >= 0 
          
          #if first day and only one gift
          if i == 0
            day = day + "#{COUNT[counter]} #{GIFTS[counter]}."
            break
          end
          
          #if it is the very last gift in the sentence
          if counter == 0
            day = day + "and #{COUNT[counter]} #{GIFTS[counter]}."
            break
          end
          
          #append in the meedle of the sentence
          day = day + "#{COUNT[counter]} #{GIFTS[counter]}, "
  
          counter = counter - 1
        end

        day = day + "\n"
        song << day
      end

      song.join("\n")
    end 
  end