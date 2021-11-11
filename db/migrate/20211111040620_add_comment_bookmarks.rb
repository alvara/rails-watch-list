class AddCommentBookmarks < ActiveRecord::Migration[6.0]
  def change
    add_column :bookmarks, :comments, :string
  end
end
