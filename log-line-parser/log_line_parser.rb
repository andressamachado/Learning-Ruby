class LogLineParser
  
  def initialize(line)
    #splits and return an array
    @line = line.split(' ')
    #shift() removes and return first array element 
    @level = @line.shift
    #join() converts array to string by grouping elements and adding a space between elements in this case 
    @message = @line.join(' ')
  end

  def message
    @message 
  end

  def log_level
    @level.delete_prefix!('[').delete_suffix!(']:').downcase
  end

  def reformat
    return "#{@message} (#{log_level})"
  end
end
