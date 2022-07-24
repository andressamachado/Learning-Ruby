module SavingsAccount
  BRACKET_LIMIT_2 = 1000
  BRACKET_LIMIT_3 = 5000
  
  RATE_LEVEL_1 = -3.213
  RATE_LEVEL_2 = 0.5
  RATE_LEVEL_3 = 1.621
  RATE_LEVEL_4 = 2.475

  def self.interest_rate(balance)
    case  
      when balance.negative?
        RATE_LEVEL_1
      when balance < BRACKET_LIMIT_2 
        RATE_LEVEL_2
      when balance < BRACKET_LIMIT_3
        RATE_LEVEL_3
      else #when balance greater than 5000
        RATE_LEVEL_4
    end
  end

  def self.annual_balance_update(balance)
    interest = (interest_rate(balance)/100) * balance.abs
    
    interest + balance
  end

  def self.years_before_desired_balance(current_balance, desired_balance)
    years = 0
  
    while current_balance < desired_balance
      current_balance = annual_balance_update(current_balance)
      years += 1
    end
    
    years
  end
end
