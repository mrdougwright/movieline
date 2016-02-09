class ActorsController < ApplicationController

  def create
    begin
      @actor = FindCreateActor.with_name(params[:actor][:name])
    rescue Exception => e
      @message = e.message
    end

    respond_to do |format|
      format.html { redirect_to actor_path(@actor) } if @actor
      format.html { render json: @message }
    end
  end

  def show
    @actor = Actor.find(params[:id])
    @movies = Tmdb::Person.credits(@actor.tmdb_id)['cast']
  end
end