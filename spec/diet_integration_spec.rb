require_relative 'spec_helper'

describe "Adding a diet" do
  let(:main_menu) do
    <<EOS
What do you want to do? (Enter the number for your choice)
1. Create a Diet Cal.
2. View your Diet Cal.
3. Edit your Diet Cal.
4. Delete your Diet Cal.
EOS
  end
  before do
    person = Person.create("Jane")
    diet = Diet.create(person.id, "Vegeterian", 6)
  end
  context "adding a diet" do
    let(:id){ Person.find_by_name("Jane").id + 1}
    let!(:output){ run_cal_meal_with_input("1", "Joe", "1", "8") }
    it "should print a confirmation message" do
      output.should include("8 Vegeterian meal diet added and your passcode is #{id}.")
    end
    it "should insert a new diet" do
      Diet.count.should == 2
    end
  end

  context "adding an invalid diet" do
    let!(:output){ run_cal_meal_with_input("1", "Joe", "4") }
    it "should print an error message" do
      output.should include("'4' is an incorrect selection! Please enter 1, 2 or 3")
    end
  end

  context "editing a diet" do
    let(:id){ Person.find_by_name("Jane").id}
    let!(:output){ run_cal_meal_with_input("3", "Jane", id, "", "2", "3", "4") }
    it "should print a confirmation message" do
      output.should include("Diet has been updated to: Full and Frequency: 4")
    end
    it "should not increase the count" do
      Diet.count.should == 1
    end
  end

  context "viewing a diet" do
    let(:id){ Person.find_by_name("Jane").id}
    let!(:output){ run_cal_meal_with_input("2", "Jane", id) }
    it "should print a confirmation message" do
      output.should include("Diet: Vegeterian diet.")
    end
  end
end
