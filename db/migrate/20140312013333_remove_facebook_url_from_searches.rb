class RemoveFacebookUrlFromSearches < ActiveRecord::Migration
  def change
    remove_column :searches, :facebook_urls, :string
  end
end
