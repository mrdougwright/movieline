module FindCreateActor
  def self.with_name(name)
    name = name.split(' ').map(&:capitalize).join(' ')
    actor = Actor.find_by_name(name)
    actor = CreateActor.with_name(name) if actor.nil?
    return actor
  end
end