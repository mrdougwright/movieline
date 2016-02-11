class AddDetailsToActor < ActiveRecord::Migration
  def change
    add_column :actors, :popularity, :float
    add_column :actors, :place_of_birth, :string
    add_column :actors, :imdb_id, :string
  end
end
