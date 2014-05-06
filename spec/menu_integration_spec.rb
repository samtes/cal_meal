require_relative 'spec_helper'

describe "Menu Integration" do
  let(:menu_text) do
<<EOS
What do you want to do? (Enter the number for your choice)
1. Create a Diet Cal.
2. View your Diet Cal.
3. Edit your Diet Cal.
4. Delete your Diet Cal.
EOS
  end
  let(:sub_menu_text_1) do
<<EOS
Select the type of diet (Enter the number for your choice)
1. Vegeterian
2. Vegan
3. Full
EOS
  end
  context "The menu should display on startup" do
    let(:shell_output) {run_cal_meal_with_input()}
    it "Should print the menu" do
      shell_output.should include(menu_text)
    end
  end
  context "User selects 1 sub menu 1" do
    let(:shell_output) {run_cal_meal_with_input("1", "1")}
    it "Should print the next menu" do
      shell_output.should include("Vegeterian diet selected.")
    end
  end
  context "User selects 1 sub menu 2" do
    let(:shell_output) {run_cal_meal_with_input("1", "2")}
    it "Should print the next menu" do
      shell_output.should include("Vegan diet selected.")
    end
  end
  context "User selects 1 sub menu 3" do
    let(:shell_output) {run_cal_meal_with_input("1", "3")}
    it "Should print the next menu" do
      shell_output.should include("Full diet selected.")
    end
  end
  context "User selects 1 sub menu 0" do
    let(:shell_output) {run_cal_meal_with_input("1", "0")}
    it "Should print the next menu" do
      shell_output.should include("'0' is an incorrect selection! Please enter 1, 2 or 3")
    end
  end
  context "User selects 1 sub menu 4" do
    let(:shell_output) {run_cal_meal_with_input("1", "4")}
    it "Should print the next menu" do
      shell_output.should include("'4' is an incorrect selection! Please enter 1, 2 or 3")
    end
  end
  context "User selects 1 sub menu ''" do
    let(:shell_output) {run_cal_meal_with_input("1", "")}
    it "Should print the next menu" do
      shell_output.should include("'' is an incorrect selection! Please enter 1, 2 or 3")
    end
  end
  context "User selects 1 sub menu" do
    let(:shell_output) {run_cal_meal_with_input("1")}
    it "Should print the next menu" do
      shell_output.should include(sub_menu_text_1)
    end
  end
  context "User selects 2" do
    let(:shell_output) {run_cal_meal_with_input("2")}
    it "Should print the next menu" do
      shell_output.should include("Enter your firstname followed by your passcode (Example <Sam 1234>)")
    end
  end
  context "User selects 3" do
    let(:shell_output) {run_cal_meal_with_input("3")}
    it "Should print the next menu" do
      shell_output.should include("Enter your firstname followed by your passcode (Example <Sam 1234>)")
    end
  end
  context "User selects 4" do
    let(:shell_output) {run_cal_meal_with_input("4")}
    it "Should print the next menu" do
      shell_output.should include("Enter your firstname followed by your passcode (Example <Sam 1234>)")
    end
  end
  context "User selects invalid entry 1" do
    let(:shell_output) {run_cal_meal_with_input("5")}
    it "Should print the menu again" do
      shell_output.should include_in_order(menu_text, "5", menu_text)
    end
    it "should include an appropriate error message" do
      shell_output.should include("'5' is an incorrect selection! Please enter 1, 2, 3 or 4")
    end
  end
  context "User selects no entry" do
    let(:shell_output) {run_cal_meal_with_input("")}
    it "Should print the menu again" do
      shell_output.should include_in_order(menu_text, "", menu_text)
    end
    it "should include an appropriate error message" do
      shell_output.should include("'' is an incorrect selection! Please enter 1, 2, 3 or 4")
    end
  end
  context "User selects 0" do
    let(:shell_output) {run_cal_meal_with_input("0")}
    it "Should print the menu again" do
      shell_output.should include_in_order(menu_text, "0", menu_text)
    end
    it "should include an appropriate error message" do
      shell_output.should include("'0' is an incorrect selection! Please enter 1, 2, 3 or 4")
    end
  end
  context "User selects negative entry" do
    let(:shell_output) {run_cal_meal_with_input("-1")}
    it "Should print the menu again" do
      shell_output.should include_in_order(menu_text, "-1", menu_text)
    end
    it "should include an appropriate error message" do
      shell_output.should include("'-1' is an incorrect selection! Please enter 1, 2, 3 or 4")
    end
  end
  context "User selects two digit number" do
    let(:shell_output) {run_cal_meal_with_input("10")}
    it "Should print the menu again" do
      shell_output.should include_in_order(menu_text, "10", menu_text)
    end
    it "should include an appropriate error message" do
      shell_output.should include("'10' is an incorrect selection! Please enter 1, 2, 3 or 4")
    end
  end
end
