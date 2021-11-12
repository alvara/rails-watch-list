require 'json'
require 'open-uri'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

p 'starting the seed, clearing db'
Bookmark.destroy_all
# List.destroy_all
Movie.destroy_all

# connect  to api
api_key = ENV['MOVIE_API']
url = "https://api.themoviedb.org/3/movie/top_rated?api_key=#{api_key}&language=en-US&page=4"
movies_serialized = URI.open(url).read
movies = JSON.parse(movies_serialized)

# loop through several pages

movies['results'].each do |movie|
  title = movie['title'] 
  overview = movie['overview']
  poster_url = movie['poster_path']
  bg_url = movie['backdrop_path']
  rating = movie['overview']
  
  Movie.create!(title: title, overview: overview, poster_url: poster_url, bg_url: bg_url, rating: rating)
end
# "backdrop_sizes"=>["w300", "w780", "w1280", "original"]
# poster_sizes"=>["w92", "w154", "w185", "w342", "w500", "w780", "original"]

p "finished seeding, created #{Movie.count} movies "
