# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

[ "Rock", "Alternative" ].each do |genre_name|
  Genre.find_or_create_by(name: genre_name)
end

[ "U2", "Radiohead" ].each do |artist_name|
  Artist.find_or_create_by(name: artist_name)
end

Album.find_or_create_by(name: "OK Computer") do |album|
  album.artist = Artist.find_by(name: "Radiohead")
  album.genre = Genre.find_by(name: "Alternative")
end

[
  "Airbag",
  "Parinoid Android",
  "Subterranean Homesick Alien",
  "Exit Music (For A Film)",
  "Let Down",
  "Karma Police",
  "Fitter Happier",
  "Electioneering",
  "Climbing Up the Walls",
  "No Suprises",
  "Lucky",
  "The Tourist"
].each_with_index do |track_title, track_index|
  Track.find_or_create_by(title: track_title) do |track|
    track.track_number = track_index + 1
    track.album = Album.find_by(name: "OK Computer")
  end
end
