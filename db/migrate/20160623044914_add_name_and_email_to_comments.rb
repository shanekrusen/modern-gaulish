class AddNameAndEmailToComments < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :guest_name, :string
    add_column :comments, :guest_email, :string
    add_index :comments, [:guest_name, :guest_email]
    add_index :comments, :guest_email
  end
end
