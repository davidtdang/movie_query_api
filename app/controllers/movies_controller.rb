class MoviesController < ApplicationController

  def index
  end

  def all
    @movies = Movie.all
    render json: @movies
  end

  def search
    if params.has_key?("t")
      @movie = Movie.select{|movie| movie.title.downcase.include?(params["t"].downcase)}
    elsif params.has_key?("y")
      @movie = Movie.select{|movie| movie.year == params["y"].to_i}
    end
    render json: @movie
  end

end
