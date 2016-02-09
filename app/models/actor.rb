class Actor < ActiveRecord::Base
  has_many :movie_actors
  has_many :movies, through: :movie_actors

  def pretty_name
    name.split(' ').map(&:capitalize).join(' ')
  end
end
