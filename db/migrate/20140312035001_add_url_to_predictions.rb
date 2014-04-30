class AddUrlToPredictions < ActiveRecord::Migration
  def change
    add_column :predictions, :url, :string
  end
end
