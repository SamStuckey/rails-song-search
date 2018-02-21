require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seed_data.csv'))

csv = CSV.parse(csv_text, headers: true)

csv.each do |song|
  song_data = song.to_hash
  next if song_data.values.any?.nil?

  artist = Artist.find_or_create_by(name: song_data["band_name"])
  album = Album.find_or_create_by(title: song_data["album_name"]) do |alb|
    alb.artist = artist
  end

  Song.create!(album: album, title: song_data["title"])
end
