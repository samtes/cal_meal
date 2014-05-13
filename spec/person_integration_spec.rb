require_relative 'spec_helper'

describe "Adding a person" do
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
  context "adding a unique person" do
    let!(:output){ run_cal_meal_with_input("1", "Joe") }
    it "should print a confirmation message" do
      output.should include("Joe has been added.")
      Person.count.should == 2
    end
    it "should insert a new person" do
      Person.count.should == 2
    end
    it "should use the name we entered" do
      Person.last.name.should == "Joe"
    end
  end
  context "adding a duplicate person" do
    let(:output){ run_cal_meal_with_input("1", "Jane") }
    it "should print an error message" do
      output.should include("Jane already exists.")
    end
    it "shouldn't save the duplicate" do
      Person.count.should == 1
    end
    context "and trying again" do
      let!(:output){ run_cal_meal_with_input("1", "Jane", "Sandy") }
      it "should save a unique item" do
        Person.last.name.should == "Sandy"
      end
      it "should print a success message at the end" do
        output.should include("Sandy has been added")
      end
    end
  end

  context "entering an invalid looking person name" do
    context "with SQL injection" do
      let(:input){ "phalangectomy'), ('425" }
      let!(:output){ run_cal_meal_with_input("1", input) }
      it "should create the person without evaluating the SQL" do
        Person.last.name.should == input
      end
      it "shouldn't create an extra person" do
        Person.count.should == 2
      end
      it "should print a success message at the end" do
        output.should include("#{input} has been added")
      end
    end
    context "without alphabet characters" do
      let(:output){ run_cal_meal_with_input("1", "4*25") }
      it "should not save the person" do
        Person.count.should == 1
      end
      it "should print an error message" do
        output.should include("'4*25' is not a valid person name, as it does not include any letters.")
      end
    end
  end

  context "editing a person" do
    let(:id){ Person.find_by_name("Jane").id}
    let(:next_menu){ "Enter 2 to edit diet type, if not hit enter" }
    let!(:output){ run_cal_meal_with_input("3", "Jane", id, "1", "Jim") }
    it "should print a confirmation message" do
      output.should include("First name has been updated to Jim.")
    end
    it "should not increase the count" do
      Person.count.should == 1
    end
  end

  context "viewing a person" do
    let(:id){ Person.find_by_name("Jane").id}
    let!(:output){ run_cal_meal_with_input("2", "Jane", id) }
    it "should print a confirmation message" do
      output.should include("Name: Jane")
    end
    it "should not increase the count" do
      Person.count.should == 1
    end
  end
end
