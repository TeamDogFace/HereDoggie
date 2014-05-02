class CreatePredictions < ActiveRecord::Migration
  def change
    create_table :predictions do |t|
      t.integer :dog_id
      t.belongs_to :search, index: true

      t.timestamps
    end
  end
end
