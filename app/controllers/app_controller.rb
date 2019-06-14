require 'json'

class AppController < ApplicationController
  include HTTParty
  $url ="https://swapi-graphql-integracion-t3.herokuapp.com/"

  def film
    response = HTTParty.post($url,
      headers: {
            'Content-Type'  => 'application/json'},
      body:
      {
        query: "query {
              film(id: \""+params[:id].to_s+"\")
              {
                title
                openingCrawl
                director
                producers
                episodeID
                releaseDate
                characterConnection{
                  characters{
                    id
                    name
                  }
                }
                starshipConnection{
                  starships{
                    id
                    name
                  }
                }
                planetConnection{
                  planets{
                    id
                    name
                  }
                }
              }
            }"

      }.to_json)
    results = response.parsed_response
    @film = results['data']["film"] # title openingCrawl director producers episodeID releaseDate
    @people = @film["characterConnection"]["characters"] # id, name
    @planets = @film["planetConnection"]["planets"] # id, name
    @starships = @film["starshipConnection"]["starships"] # id, name
  end

  def person
    response = HTTParty.post($url,
            headers: {
                'Content-Type'  => 'application/json'},
            body:{
                query: "query { person(id: \""+params[:id].to_s+"\")
                {
                  name
                  skinColor
                  height
                  hairColor
                  mass
                  eyeColor
                  birthYear
                  gender

                  filmConnection{
                    films{
                      title
                      id

                    }
                  }
                  starshipConnection{
                    starships{
                      name
                      id
                    }
                  }
                  homeworld{
                    name
                    id
                  }
                }
                  }"

            }.to_json)
    results = response.parsed_response
    @person = results["data"]["person"]
    @films = @person["filmConnection"]["films"]
    @starships = @person["starshipConnection"]["starships"]
    @origin_planet = @person["homeworld"] # name, id
  end

  def starship
    response = HTTParty.post($url,
            headers: {
                'Content-Type'  => 'application/json'},
            body:{
                query: "query {starship(id: \""+params[:id].to_s+"\")
                {
                  name
                  length
                  model
                  manufacturers
                  costInCredits
                  maxAtmospheringSpeed
                  crew
                  passengers
                  cargoCapacity
                  consumables
                  hyperdriveRating
                  MGLT
                  starshipClass

                  filmConnection{
                    films
                    {
                      id
                      title
                    }
                  }
                  pilotConnection{
                    pilots
                    {
                      name
                      id
                    }
                  }
                }
                  }"
            }.to_json)
    results = response.parsed_response
    @starship = results['data']['starship']
    @films = @starship["filmConnection"]["films"]
    @pilots = @starship["pilotConnection"]["pilots"]
  end

  def planet
    response = HTTParty.post($url,
            headers: {
                'Content-Type'  => 'application/json'},
            body:{
                query: "query {planet(id: \""+params[:id].to_s+"\")
                {
                  name
                  terrains
                  gravity
                  surfaceWater
                  diameter
                  climates
                  population
                  orbitalPeriod
                  rotationPeriod

                  residentConnection{
                    residents
                    {
                      id
                      name
                    }
                  }
                  filmConnection{
                    films{
                      id
                      title
                    }
                  }
                }
                  }"

            }.to_json)
    results = response.parsed_response
    @planet = results["data"]["planet"]
    @films = @planet["filmConnection"]["films"] #id title
    @residents = @planet["residentConnection"]["residents"] # id, name
  end

  def index
    response = HTTParty.post($url,
    headers: {
        'Content-Type'  => 'application/json'},
    body:{
        query: "query {
            allFilms{
              films{
                id
                releaseDate
                title
                episodeID
                director
                producers
              }
            }
          }"

    }.to_json)
    results = response.parsed_response
    @films = results["data"]["allFilms"]["films"]
  end
end
