class Commentary_Scrape < Bible_Scrape


  def initialize(book, chapter )
    super(book, chapter)
    set_commentary_to_matthew_henry
  end

  def set_commentary_to_matthew_henry
    @commentary = "mhc"
  end

  def set_commentary_to_sermon_bible
    @commentary = "sermon"
  end

  def display
    puts get_commentary
  end

  def get_commentary

    page = Nokogiri::HTML(open("https://biblehub.com/commentaries/#{@commentary}/#{@book}/#{@chapter}.htm"))

    result = ""
    page.css(".chap").each do |source|
      t = source.text

      result << t
    end

    return result
  end


end
