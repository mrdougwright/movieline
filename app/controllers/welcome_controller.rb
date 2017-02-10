class WelcomeController < ApplicationController
  def index
    @actor = Actor.new
    @error = params[:error]
  end
end
