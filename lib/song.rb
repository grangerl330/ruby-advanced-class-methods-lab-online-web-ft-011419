class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create 
    self.all << self.new
    self.all[-1]
  end 
  # self.all is defined as @@all above, so we use self.all when we need to access @@all in any other method. 
  
  def self.new_by_name(name)
    song = self.new
    song.name = name 
    song
  end 
  
  def self.create_by_name(name)
    song = self.new
    song.name = name 
    self.all << song 
    song 
  end  
  
  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end 
  # Iterates through self.all (@@all) with .find to find and return the song in that array with a name equal to the name given 
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name) : self.create_by_name(name)
  end  
  # Ternary operator. If self.find_by_name(name) exists, then it executes self.find_by_name(name). If not, then it executes self.create_by_name(name)
  
  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end 
require 'pry'
  def self.new_from_filename(filename)
    song = self.new
    song.name = filename.split(/[-.]/)[1].strip
    song.artist_name = filename.split(/[-.]/)[0].strip
    array = filename.split(/[-.]/)
    self.all << song 
    song 
  end 
  # Use filename.split with a regex argument. /[-.]/ tells .split to split whenever it sees a dash or a period. This returns an array of 3 strings, the artist, the song name, and .mp3. For song.name, we find the [1] index of the array which is the song name and call .strip on it to remove any whitespaces on at the front or the end. 
end



