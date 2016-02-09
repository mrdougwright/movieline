class ActorsController < ApplicationController

  def create
    @actor = FindCreateActor.with_name(params[:actor][:name])
    respond_to do |format|
      format.html { redirect_to actor_path(@actor) }
    end
  end

  def show
    @actor = Actor.find(params[:id]) 
  end
end