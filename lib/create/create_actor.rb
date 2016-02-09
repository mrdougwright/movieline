module CreateActor
  def self.with_name(name)
    actor = Tmdb::Person.find(name).first
    raise "Can't find actor by that name" if actor.nil?
    Actor.create(name: actor.name.downcase, tmdb_id: actor.id)
  end
end