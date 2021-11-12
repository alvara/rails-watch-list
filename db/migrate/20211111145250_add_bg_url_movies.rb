class AddBgUrlMovies < ActiveRecord::Migration[6.0]
  def change
    add_column :movies, :bg_url, :string
  end
end
