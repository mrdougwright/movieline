class WelcomeController < ApplicationController
  def index
    @actor = Actor.new
  end
end
