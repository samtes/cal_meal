require_relative 'spec_helper'

describe "Menu Integration" do
  let(:menue_text) do
<<EOS
What do you want to do? (Enter the number for your choice)
1. Create a Diet Cal.
2. View your Diet Cal.
3. Edit your Diet Cal.
4. Delete your Diet Cal.
EOS
  end
  context "The menu should display on startup" do
    let(:shell_output) {run_cal_meal_with_input()}
    it "Should print the menu" do
      shell_output.should include(menue_text)
    end
  end
end
