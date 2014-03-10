class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :image_path
      t.datetime :date_lost
      t.integer :num_results
      t.string :email
      t.binary :finished

      t.timestamps
    end
  end
end
