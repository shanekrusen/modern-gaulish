class AddUseridToBios < ActiveRecord::Migration[5.0]
  def change
    add_column :bios, :user_id, :integer
  end
end
