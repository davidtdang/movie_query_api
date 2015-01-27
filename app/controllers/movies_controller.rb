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
      # @movie = Movie.select(:title => params[:t])
    elsif params.has_key?("y")
      @movie = Movie.select{|movie| movie.year == params["y"].to_i}
    elsif params.has_key?("i")
      @movie = Movie.select{|movie| movie.id == params["i"].to_i}
    end
    render json: @movie
  end

end
