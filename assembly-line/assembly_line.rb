class AssemblyLine
  CARS_PER_HOUR = 221.0
  DEDUCTION_LVL1 = 1.0
  DEDUCTION_LVL2 = 0.9
  DEDUCTION_LVL3 = 0.8
  DEDUCTION_LVL4 = 0.77
  
  def initialize(speed)
    @speed = speed
    @deduction = set_deduction(speed)
  end

  def production_rate_per_hour
    CARS_PER_HOUR * @speed * @deduction
  end

  def working_items_per_minute
    (production_rate_per_hour/60).to_int
  end

  private
  
  def set_deduction(speed)
    @deduction = case speed
    when 5..8
      DEDUCTION_LVL2
    when 9
      DEDUCTION_LVL3
    when 10
      DEDUCTION_LVL4
    else
      DEDUCTION_LVL1
    end
  end 
end