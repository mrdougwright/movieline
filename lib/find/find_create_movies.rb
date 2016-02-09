module FindCreateMovies
  def self.with_actor_tmdb_id(tmdb_id)
    actor = Actor.find_by_tmdb_id(tmdb_id)
    tmdb_movies = Tmdb::Person.credits(tmdb_id)['cast'].select{|m| m['media_type'] == 'movie'}

    tmdb_movies.each do |movie|
      if Movie.pluck(:title).include? movie['title']
        m = Movie.find_by_title(movie['title'])
      else
        movie_detail = Tmdb::Movie.detail(movie['id'])
        m = Movie.create(
          title: movie['title'], release_date: movie['release_date'],
          tmdb_id: movie['id'], vote_average: movie_detail['vote_average']
        )
      end

      if MovieActor.where(actor_id: actor.id, movie_id: m.id).blank?
        MovieActor.create(actor_id: actor.id, movie_id: m.id)
      end
    end

    return actor.movies
  end

end
