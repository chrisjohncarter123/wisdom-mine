require_relative "./user_input.rb"

class Input_Set

  def initialize(lines)
    @lines = lines
  end

  def display
    puts "\n"
    result = []
    @lines.each_with_index do |c|
      puts c.green
      result << User_Input.get_input
    end
    return  result
  end

end
