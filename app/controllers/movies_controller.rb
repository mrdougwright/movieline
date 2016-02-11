class MoviesController < ApplicationController
  def index
    @movies = Movie.all.order(release_date: :desc)
  end
end