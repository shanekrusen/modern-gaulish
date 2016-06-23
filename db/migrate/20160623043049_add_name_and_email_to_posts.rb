class AddNameAndEmailToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :guest_name, :string
    add_column :posts, :guest_email, :string
    add_index :posts, [:guest_name, :guest_email]
    add_index :posts, :guest_email
  end
end
