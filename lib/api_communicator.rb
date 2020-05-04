require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name)
  #make the web request
  swapi_search_base = 'http://swapi.dev/api/people/?search='
  swapi_search_url = swapi_search_base + character_name
  
  response_string = RestClient.get(swapi_search_url)
  response_char_hash = JSON.parse(response_string)
  film_url_array = response_char_hash["results"][0]["films"]
  film_array_of_hashes = film_url_array.map do |film|
    x = RestClient.get(film)
    JSON.parse(x)
  end
  film_array_of_hashes
  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.
end

def print_movies(films)
  # some iteration magic and puts out the movies in a nice list
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
  # puts "May the 4th be with you"
  # puts "My favorite character is #{character}"
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
