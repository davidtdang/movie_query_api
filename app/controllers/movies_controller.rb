class MoviesController < ApplicationController

  def index
  end

  def all
    @movies = Movie.all
    render json: @movies
  end

  def search
    if params[:t]
      @movie = Movie.where(:title => params[:t])
    elsif params[:y]
      @movie = Movie.where(:year => params[:y])
    elsif params[:t] && params[:y]
      @movie = Movie.where(:title => params[:t], :year => params[:y])
    end
    render json: @movie
  end

end
