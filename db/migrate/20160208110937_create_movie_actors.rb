class CreateMovieActors < ActiveRecord::Migration
  def change
    create_table :movie_actors do |t|
      t.integer :actor_id, index: true
      t.integer :movie_id, index: true

      t.timestamps null: false
    end
  end
end
