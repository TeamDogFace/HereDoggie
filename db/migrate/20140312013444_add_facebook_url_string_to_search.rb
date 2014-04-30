class AddFacebookUrlStringToSearch < ActiveRecord::Migration
  def change
    add_column :searches, :facebook_url_string, :text
  end
end
