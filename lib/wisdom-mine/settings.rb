class Settings


  @@bible_version = "esv"


  def self.set_bible_to_esv
    @@bible_version = "esv"
  end

  def self.set_bible_to_nlt
    @@bible_version = "nlt"
  end

  def self.set_bible_to_niv
    @@bible_version = "niv"
  end

  def self.bible_version
    return @@bible_version
  end
end