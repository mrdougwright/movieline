class ActorsController < ApplicationController

  def create
    begin
      @actor = FindCreateActor.with_name(params[:actor][:name])
    rescue Exception => e
      @message = e.message
    end

    if @actor
      respond_to { |f| f.html { redirect_to actor_path(@actor) } }
    else
      respond_to { |f| f.html { render json: @message } }
    end
  end

  def show
    @actor = Actor.find(params[:id])
    @movies = FindCreateMovies.with_actor_tmdb_id(@actor.tmdb_id)
  end

  def index
    @actors = Actor.all.order(popularity: :desc)
  end
end
