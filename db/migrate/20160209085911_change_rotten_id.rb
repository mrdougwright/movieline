class ChangeRottenId < ActiveRecord::Migration
  def up
    remove_column :movies, :rotten_id
    remove_column :movies, :critics_score
    add_column :movies, :tmdb_id, :integer
    add_column :movies, :vote_average, :float
  end

  def down
    add_column :movies, :rotten_id, :string
    add_column :movies, :critics_score, :integer
    remove_column :movies, :tmdb_id
    remove_column :movies, :vote_average
  end
end
