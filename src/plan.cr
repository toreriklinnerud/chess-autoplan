class Plan
  P1   = Plan.new(1, "513")
  P5   = Plan.new(5, "514")
  P10  = Plan.new(10, "515")
  P20  = Plan.new(20, "516")
  P100 = Plan.new(100, "517")
  PUnknown = Plan.new(0, "U")

  PLANS = [P1, P5, P10, P20, P100]

  getter :size, :id

  def initialize(@size : Int32, @id : String)
  end

  def self.best(current_usage)
    (PLANS.find { |plan| plan.size > current_usage + 0.5 } || PLANS.last).as(Plan)
  end

  def self.of_size(size)
    PLANS.find { |plan| plan.size == size } || PUnknown
  end

  def to_s
    "#{@size} GB Plan"
  end

  def ==(other)
    self.size == other.size
  end
end
