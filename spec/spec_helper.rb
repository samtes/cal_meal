require 'rspec/expectations'


def run_cal_meal_with_input(*inputs)
  shell_output = ""
  IO.popen('./cal_meal', 'r+') do |pipe|
    inputs.each do |input|
      pipe.puts input
    end
    pipe.close_write
    shell_output << pipe.read
  end
  shell_output
end
