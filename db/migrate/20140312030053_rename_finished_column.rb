class RenameFinishedColumn < ActiveRecord::Migration
  def change
    rename_column :searches, :finished, :status
  end
end
