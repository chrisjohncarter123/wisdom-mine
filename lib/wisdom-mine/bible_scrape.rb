require 'nokogiri'
require 'open-uri'
require './settings.rb'
require './chapter.rb'


class Bible_Scrape

  attr_accessor :book, :chapter

  def initialize(book="john", chapter=nil)
    @book = book
    @chapter = chapter

  end




  def get_chapter

    page = Nokogiri::HTML(open("https://biblehub.com/#{Settings.bible_version}/#{@book}/#{@chapter}.htm"))

    # https://www.biblegateway.com/passage/?search=#{@book}+#{@chapter}&version=#{Settings.bible_version}"))

    result = ""
    page.css(".chap").each do |source|
      t = source.text

      result += t
    end

    return result
  end



  def make_chapter
    c = Chapter.new_from_page(get_chapter)
    return c
  end




end
