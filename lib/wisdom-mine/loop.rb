


require './bible_scrape.rb'
require './commentary_scrape.rb'
require './cli_command.rb'
require './user_input.rb'
require './menu.rb'
require "./input_set.rb"
require 'colorize'

class Loop


  @@running = true

  def self.run

    input = ""

    puts"░██╗░░░░░░░██╗██╗░██████╗██████╗░░█████╗░███╗░░░███╗".red.on_blue
    puts"░██║░░██╗░░██║██║██╔════╝██╔══██╗██╔══██╗████╗░████║".red.on_blue
    puts"░╚██╗████╗██╔╝██║╚█████╗░██║░░██║██║░░██║██╔████╔██║".red.on_blue
    puts"░░████╔═████║░██║░╚═══██╗██║░░██║██║░░██║██║╚██╔╝██║".red.on_blue
    puts"░░╚██╔╝░╚██╔╝░██║██████╔╝██████╔╝╚█████╔╝██║░╚═╝░██║".red.on_blue
    puts"░░░╚═╝░░░╚═╝░░╚═╝╚═════╝░╚═════╝░░╚════╝░╚═╝░░░░░╚═╝".red.on_blue
    puts"                                                    ".on_blue

    puts"           ███╗░░░███╗██╗███╗░░██╗███████╗          ".red.on_blue
    puts"           ████╗░████║██║████╗░██║██╔════╝          ".red.on_blue
    puts"           ██╔████╔██║██║██╔██╗██║█████╗░░          ".red.on_blue
    puts"           ██║╚██╔╝██║██║██║╚████║██╔══╝░░          ".red.on_blue
    puts"           ██║░╚═╝░██║██║██║░╚███║███████╗          ".red.on_blue
    puts"           ╚═╝░░░░░╚═╝╚═╝╚═╝░░╚══╝╚══════╝          ".red.on_blue

    puts "Welcome to " + "Wisdom Mine!".bold

    while(@@running == true) do

      commands = []
      commands << CLI_Command.new("1", "View a chapter of a book of the Bible", self.method(:chapter))
      commands << CLI_Command.new("2", "View a chapter of a commentary", self.method(:commentary_chapter))
      commands << CLI_Command.new("s", "Settings", self.method(:settings))
      commands << CLI_Command.new("q", "Quit", self.method(:quit))

      main_menu = Menu.new("Main Menu", commands)
      main_menu.display_and_get_input

    end

  end

  def self.update_input
    @@input = gets.chomp
  end

  def self.book
    lines = []
    lines << "Enter name of bible book:"
    i = Input_Set.new(lines)
    result = i.display

    c = Bible_Scrape.new(result[0],result[1])
    c.display
  end

  def self.chapter
    lines = []
    lines << "Enter name of bible book:"
    lines << "Enter chapter number:"
    i = Input_Set.new(lines)
    result = i.display

    c = Bible_Scrape.new(result[0],result[1])
    c.display

  end

  def self.verse
    lines = []
    lines << "Enter name of bible book:"
    lines << "Enter chapter number:"
    lines << "Enter verse number:"
    i = Input_Set.new(lines)
    result = i.display

    c = Bible_Scrape.new(result[0],result[1])
    c.display

  end

  def self.commentary_chapter
    commands = []
    commands << CLI_Command.new("m", "Matthew Henry's Commentary")
    commands << CLI_Command.new("s", "Sermon Bible")
    commands << CLI_Command.new("b", "Back to main menu")

    menu = Menu.new("Choose bible Commentary", commands)
    menu.display

    input = User_Input.get_input

    if(input == "b")
      back_to_main_menu
      return
    end

    lines = []
    lines << "Enter name of bible book:"
    lines << "Enter chapter number:"
    i = Input_Set.new(lines)
    result = i.display

    c = Commentary_Scrape.new(result[0],result[1])

    case input
    when "m"
      c.set_commentary_to_matthew_henry
    when "s"
      c.set_commentary_to_sermon_bible
    end

    c.display

  end

  def self.settings
    commands = []
    commands << CLI_Command.new("1", "Change the bible version used", self.method(:change_bible_version))
    commands << CLI_Command.new("b", "Back to main menu", self.method(:back_to_main_menu))

    menu = Menu.new("Settings", commands)
    menu.display_and_get_input
  end

  def self.change_bible_version
    commands = []

    commands << CLI_Command.new("nlt", "New Living Translation", self.method(:set_nlt))
    commands << CLI_Command.new("niv", "New International Version", self.method(:set_niv))
    commands << CLI_Command.new("esv", "English Standard Version", self.method(:set_esv))

    commands = commands.sort_by{ |c | c.description }

    commands << CLI_Command.new("b", "Back to main menu.", self.method(:back_to_main_menu))

    menu = Menu.new("Choose Version", commands)
    menu.display_and_get_input
  end

  def self.set_esv
    Settings.set_bible_to_esv
    puts "Set to esv."
  end
  def self.set_nlt
    Settings.set_bible_to_nlt
    puts "Set to nlt."
  end
  def self.set_niv
    Settings.set_bible_to_niv
    puts "Set to niv."
  end



  def self.back_to_main_menu

  end

  def self.quit
    puts "\nThank you for using Wisdom Mine!"
    @@running = false
  end


  end


  Loop.run