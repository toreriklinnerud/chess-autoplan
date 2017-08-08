require "spec"
require "./../src/Plan"

describe Plan do
  describe "#best" do
    it "picks the best plan for the current usage" do
      Plan.best(0.0).should eq Plan::P1
      Plan.best(0.4).should eq Plan::P1
      Plan.best(0.6).should eq Plan::P5
      Plan.best(1.6).should eq Plan::P5
      Plan.best(4.0).should eq Plan::P5
      Plan.best(19.0).should eq Plan::P20
      Plan.best(50.0).should eq Plan::P100
      Plan.best(150.0).should eq Plan::P100
    end
  end

  describe "#of_size" do
    it "selects the plan of the given size" do
      Plan.of_size(5).should eq Plan::P5
      Plan.of_size(110).should eq Plan::PUnknown
    end
  end
end
