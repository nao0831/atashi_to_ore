class AddPictureToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :picture_data, :binary
    add_column :posts, :content_type, :string
  end
end
