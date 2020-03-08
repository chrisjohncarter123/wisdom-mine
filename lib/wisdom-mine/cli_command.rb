class CLI_Command
  attr_accessor :input, :description, :method

  def initialize(input, description, method = nil)
    @input = input
    @description = description
    @method = method
  end
  def call_method
    if(method != nil)
      @method.call
    end

  end
  def test_and_call(input)
    if(method == nil)
      return nil
    end

    if(input == @input)
      @method.call
      return true
    end
    return false
  end

end