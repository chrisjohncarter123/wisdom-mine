class Chapter


  def initialize(text)
    @text = "hiii" + text
  end

  def self.new_from_page(page)

    self.new(page)

  end

  def display

    puts @text

  end

end