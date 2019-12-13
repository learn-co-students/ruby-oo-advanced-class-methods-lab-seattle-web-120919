require 'pry'
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
    song = Song.new
    song.save
    return song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(song_name)
    self.all.find {|s| s.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    song = self.find_by_name(song_name)
    song ? song : self.create_by_name(song_name)
  end 

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end 

  def self.new_from_filename(song_file_name)
    song_file_array = song_file_name.split(/[-.]/)
    song = self.find_or_create_by_name(song_file_array[1].strip)
    song.artist_name = song_file_array[0].strip
    return song  
  end

  def self.create_from_filename(song_file_name)
    self.new_from_filename(song_file_name)
  end

  def self.destroy_all
    self.all.clear

  end 


end
