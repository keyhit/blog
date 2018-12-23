class AddYoutubeToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :youtube, :string
  end
end
