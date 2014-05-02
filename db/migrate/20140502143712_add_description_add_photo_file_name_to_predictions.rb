class AddDescriptionAddPhotoFileNameToPredictions < ActiveRecord::Migration
  def change
    add_column :predictions, :description, :text
    add_column :predictions, :photo_file_name, :string
  end
end
