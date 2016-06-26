class CreateUserNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :user_notifications do |t|
      t.text :notification
      t.integer :user_id
      t.integer :post_id

      t.timestamps
    end
  end
end
