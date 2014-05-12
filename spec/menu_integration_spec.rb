require_relative 'spec_helper'

describe "Menu Integration" do
  let(:main_menu) do
    <<EOS
What do you want to do? (Enter the number for your choice)
1. Create a Diet Cal.
2. View your Diet Cal.
3. Edit your Diet Cal.
4. Delete your Diet Cal.
EOS
  end
  let(:sub_menu_1) do
    <<EOS
Select the type of diet (Enter the number for your choice)
1. Vegeterian
2. Vegan
3. Full
EOS
  end
  let(:sub_menu_2) do
    <<EOS
How many meals a day? (Enter the number between 3 and 9)
EOS
  end
  let(:enter_name) do
    <<EOS
Enter your firstname (Example <Sam>)
EOS
  end
  let(:enter_passcode) do
    <<EOS
Enter your firstname followed by your passcode (Example <Sam 1234>)
EOS
  end

  context "The menu should display in startup" do
    let(:shell_output){ run_cal_meal_with_input() }
    it "should print the menu" do
      shell_output.should include(main_menu)
    end
  end
  context "The sub menu should display with valid entry 1" do
    let(:shell_output){ run_cal_meal_with_input("1") }
    it "should print the menu" do
      shell_output.should include(enter_name)
    end
  end
  context "The sub menu should display with valid entry 2" do
    let(:shell_output){ run_cal_meal_with_input("2") }
    it "should print the menu" do
      shell_output.should include(enter_name)
    end
  end
  context "The sub menu should display with valid entry 3" do
    let(:shell_output){ run_cal_meal_with_input("3") }
    it "should print the menu" do
      shell_output.should include(enter_name)
    end
  end
  context "The sub menu should display with valid entry 4" do
    let(:shell_output){ run_cal_meal_with_input("4") }
    it "should print the menu" do
      shell_output.should include(enter_name)
    end
  end
  context "Error message should display with no entry" do
    let(:shell_output){ run_cal_meal_with_input("") }
    it "should print the menu again" do
      shell_output.should include_in_order(main_menu, "", main_menu)
    end
    it "Should display the correct error message" do
      shell_output.should include("'' is an incorrect selection! Please enter 1, 2, 3 or 4")
    end
  end
  context "Error message should display with invalid entry 0" do
    let(:shell_output){ run_cal_meal_with_input("0") }
    it "should print the menu again" do
      shell_output.should include_in_order(main_menu, "0", main_menu)
    end
    it "Should display the correct error message" do
      shell_output.should include("'0' is an incorrect selection! Please enter 1, 2, 3 or 4")
    end
  end
  context "Error message should display with invalid entry" do
    let(:shell_output){ run_cal_meal_with_input("5") }
    it "should print the menu again" do
      shell_output.should include_in_order(main_menu, "5", main_menu)
    end
    it "Should display the correct error message" do
      shell_output.should include("'5' is an incorrect selection! Please enter 1, 2, 3 or 4")
    end
  end
  context "Error message should display with negative entry" do
    let(:shell_output){ run_cal_meal_with_input("-1") }
    it "should print the menu again" do
      shell_output.should include_in_order(main_menu, "-1", main_menu)
    end
    it "Should display the correct error message" do
      shell_output.should include("'-1' is an incorrect selection! Please enter 1, 2, 3 or 4")
    end
  end
  context "Error message should display with 2 digits entry" do
    let(:shell_output){ run_cal_meal_with_input("10") }
    it "should print the menu again" do
      shell_output.should include_in_order(main_menu, "10", main_menu)
    end
    it "Should display the correct error message" do
      shell_output.should include("'10' is an incorrect selection! Please enter 1, 2, 3 or 4")
    end
  end
  context "The sub menu 2 should display with valid entry" do
    let(:shell_output){ run_cal_meal_with_input("1", "Tam", "1") }
    it "should print the correct name added message" do
      shell_output.should include(sub_menu_2)
    end
  end
  context "The sub menu 2 should display with valid entry" do
    let(:shell_output){ run_cal_meal_with_input("1", "Bam") }
    it "should print the correct name added message" do
      shell_output.should include(sub_menu_1)
    end
  end
end
