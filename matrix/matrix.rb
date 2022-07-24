class Matrix 
  attr_reader :rows, :columns

  def initialize(input)
    @rows = set_rows(input)
    @columns = set_columns(@rows)
  end

  def set_rows(input)
    matrix_rows = input.split("\n")
    rows = [] 
    
    matrix_rows.each do |row|
      rows << row.split(" ").map(&:to_i)
    end

    rows
  end

  def set_columns(rows)
    @rows.transpose
  end 
end 