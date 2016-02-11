module CreateActor
  def self.with_name(name)
    actor = Tmdb::Person.find(name).first
    if actor.nil?
      raise "Can't find actor by that name"
    else
      actor = Tmdb::Person.detail(actor.id)
    end
    Actor.create(
      name: actor['name'], tmdb_id: actor['id'],
      imdb_id: actor['imdb_id'], popularity: actor['popularity'],
      place_of_birth: actor['place_of_birth']
    )
  end
end