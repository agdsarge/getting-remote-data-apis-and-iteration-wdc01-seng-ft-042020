require 'rest-client'
require 'json'
require 'pry'

def check_for_valid_input(character)
    swapi_search_base = 'http://swapi.dev/api/people/?search='
    swapi_search_url = swapi_search_base + character
    response_string = RestClient.get(swapi_search_url)
    response_char_hash = JSON.parse(response_string)
    if response_char_hash["count"] == 0
        puts "Sorry, please check your spelling or input a valid character name."
        return false
    elsif response_char_hash["count"] > 1
        puts "There is more than one character who matches the query #{character}."
        puts "We will return the first, whose name is #{response_char_hash["results"][0]["name"]}."
        return [true , response_char_hash]
    else
        return [true , response_char_hash]
    end
end

def get_character_movies_from_api(response_char_hash)
    film_url_array = response_char_hash["results"][0]["films"]
    film_array_of_hashes = film_url_array.map do |film|
        x = RestClient.get(film)
        JSON.parse(x)
    end
    film_array_of_hashes
end

def print_movies(films)
    puts "This character appears in:"
    films.each do |fm_h|
        puts "_#{fm_h["title"]}_, directed by #{fm_h["director"]}.\nThis is episode #{fm_h["episode_id"]}."
    end
end

def show_character_movies(character)
    films = get_character_movies_from_api(character)
    print_movies(films)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
