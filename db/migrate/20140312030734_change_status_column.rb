class ChangeStatusColumn < ActiveRecord::Migration
  def up
    change_column :searches, :status, :string
    change_column :searches, :status, :string, default: "queued"
  end

  def down
    change_column :searches, :status, :binary
    change_column :searches, :status, :string, default: nil
  end
end
