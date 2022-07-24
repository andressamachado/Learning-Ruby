class TwoBucket
  
  def initialize(first_bucket_capacity, second_bucket_capacity, desired_liters, start_bucket)
    @desired_liters = desired_liters
    @moves = 0

    first_bucket = Bucket.new(first_bucket_capacity, 'one')
    second_bucket = Bucket.new(second_bucket_capacity, 'two')
    
    case start_bucket
      when 'one'
        @start_bucket = first_bucket
        @other_bucket = second_bucket
      when 'two' 
        @start_bucket = second_bucket
        @other_bucket = first_bucket
    end 
    
    moves
  end 

  def moves
    until @start_bucket.liters == @desired_liters || @other_bucket.liters == @desired_liters
        
    if @start_bucket.empty?    # first bottle is empty, fill it out
        @start_bucket.fill_to_max
        @moves += 1
        next
      end 
      
      if @other_bucket.capacity == @desired_liters    # other_bucket capacity equals to desired_liters, fill it directly 
        @other_bucket.fill_to_max
        @moves += 1
        next
      end

      if @other_bucket.full?    # second bottle is full, make it empty
        @other_bucket.empty
        @moves += 1 
        next
      end

      # pour from start bottle to second one
      liters_to_full = @other_bucket.capacity - @other_bucket.liters
        
      if @start_bucket.liters - liters_to_full <= 0    # pour the whole content
        @other_bucket.fill(@start_bucket.liters)
        @start_bucket.empty
      else    # fill only until reach max capacity 
        @other_bucket.fill(liters_to_full)
        remaining = @start_bucket.liters - liters_to_full
        @start_bucket.dump(remaining)
      end

      @moves += 1
    end

    @moves
  end

  def goal_bucket
   @start_bucket.liters == @desired_liters ? @start_bucket.id : @other_bucket.id
  end

  def other_bucket
    @start_bucket.liters == @desired_liters ? @other_bucket.liters : @start_bucket.liters
  end

  class Bucket 
    attr_accessor :capacity, :liters, :id

    def initialize(capacity, identifier)
      @id = identifier
      @capacity = capacity
      @liters = 0
    end 

    def full?
      @liters == @capacity 
    end

    def fill_to_max
      @liters = @capacity
    end

    def fill(liters_to_full)
      @liters += liters_to_full
    end

    def empty?
      @liters == 0 
    end

    def empty
      @liters = 0
    end

    def dump(remaining)
      @liters = remaining
    end
  end
end