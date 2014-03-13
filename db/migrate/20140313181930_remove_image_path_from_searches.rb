class RemoveImagePathFromSearches < ActiveRecord::Migration
  def change
    remove_column :searches, :image_path, :string
  end
end
