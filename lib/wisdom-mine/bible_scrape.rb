require 'nokogiri'
require 'open-uri'
require './settings.rb'


class Bible_Scrape

  attr_accessor :book, :chapter

  def initialize(book="john", chapter=nil)
    @book = book
    @chapter = chapter

  end

  def display

    if(chapter == nil)
      puts "#{book} - #{Settings.bible_version}"
      puts get_book
    else
      puts "#{book} #{chapter} - #{Settings.bible_version}"
      puts get_chapter
    end
  end


  def get_chapter

    page = Nokogiri::HTML(open("https://biblehub.com/#{Settings.bible_version}/#{@book}/#{@chapter}.htm"))

    # https://www.biblegateway.com/passage/?search=#{@book}+#{@chapter}&version=#{Settings.bible_version}"))

    result = ""
    page.css(".chap").each do |source|
      t = source.text

      result << t
    end

    return result
  end




end
