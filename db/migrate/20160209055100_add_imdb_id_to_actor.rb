class AddImdbIdToActor < ActiveRecord::Migration
  def change
    add_column :actors, :tmdb_id, :integer
  end
end
