class CreateFacebookUrls < ActiveRecord::Migration
  def change
    create_table :facebook_urls do |t|
      t.string :url
      t.belongs_to :search, index: true

      t.timestamps
    end
  end
end
