require_relative './user_input.rb'

class Menu

  def initialize(menu_name, commands)
    @menue_name = menu_name
    @commands = commands
  end

  def display_and_get_input
    display
    get_input
  end

  def display
    puts "\n"
    puts "::#{@menue_name}::".bold.blue
    puts "-------------------------"

    @commands.each do |c|
      puts "#{c.input}".yellow + " - " + "#{c.description}".green
    end


  end

  def get_input
    input = User_Input.get_input

    @commands.each do |c|

      if(c.input==input)
        c.call_method

      end

    end
  end


end