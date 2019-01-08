require 'rest-client'
require 'json'
require 'pry'

# Nate Hunter & Simon Kong

def get_character_movies_from_api(character_name)
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)

  film_array = []

  # if response_hash["results"].fetch("name") == character_name
  #   binding.pry



  #end
    response_hash.each do |title, data| # data is an array

      #binding.pry

      if title == "results"
        data.each do |info| # info is a hash
          #binding.pry
          if info.fetch("name") == character_name # gets name
            info["films"].each do |url|
              #binding.pry
              movie_url = RestClient.get(url)
              movie_hash = JSON.parse(movie_url)
              film_array << movie_hash
            end # data do
          end # if info
        end #  do info
      end # if title
    end # do response_hash
  film_array
  #binding.pry
end
  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.


#get_character_movies_from_api("R2-D2")



def print_movies(films)
  # some iteration magic and puts out the movies in a nice list
  # This is the method in which you will iterate over that array of hashes to puts out movie information to the terminal.
  # films.each do |title, info|
  #   if title == "title"
  #     puts info
  #   end
  # end

  films.each do |element|
    element.each do |title, name|
    #binding.pry
      if title == "title"
        puts name
      end
    end
  end
end


def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

#show_character_movies("R2-D2")

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
