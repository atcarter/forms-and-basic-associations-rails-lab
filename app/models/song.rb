class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes
  # accepts_nested_attributes_for :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end
  
  def artist_name
    self.artist ? self.artist.name : nil
  end

  def note_contents=(contents)
    contents.each do |c| #need to account for the fact that this might be nil 
      # byebug
      note = self.notes.build(content: c)
    end
  end

  def note_contents
    # self.notes ? self.note_contents :nil
    self.notes.map do |note|
      note.content
    end
  end

end
