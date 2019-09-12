class Artist 
  attr_accessor :name, :songs 
  
  @@all = []
  
  def initialize(name)
    @songs = []
    @name = name
  end
  
  def self.all
    @@all
  end
  
  def songs=(name)
    @songs 
  end
  
  def songs
    Song.find_by_artist(self)
  end
  
  def add_song(song)
    self.songs << song 
    song.artist = self 
  end
  
  def save 
    @@all << self 
  end
  

  def self.find_or_create_by_name(name)
    self.find(name) || self.create(name)
  end

  def self.find(name)
    self.all.detect{|a| a.name == name}
  end
  
  def self.create(name)
    Artist.new(name)
  end
  
  def print_songs
    self.songs.each do |song|
      puts song.name 
    end
  end
  
end
