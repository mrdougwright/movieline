module FindCreateActor
  def self.with_name(name)
    name = name.downcase.strip
    actor = Actor.find_by_name(name)
    actor = CreateActor.with_name(name) if actor.nil?
    return actor
  end
end