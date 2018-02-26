class Song < ApplicationRecord
  belongs_to :album
  has_one :artist, through: :album

  def self.find_by_query(song: false, artist: false, album: false)
    songs = all
    songs = songs.where("songs.title LIKE ?", "%#{song}%") if song
    songs = songs.joins(:album).where("albums.title LIKE ?", "%#{album}%") if album
    songs = songs.joins(:artist).where("artists.name LIKE ?", "%#{artist}%") if artist

    songs
  end
end
