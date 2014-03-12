class AddFacebookUrlsToSearch < ActiveRecord::Migration
  def change
    add_column :searches, :facebook_urls, :string
  end
end
