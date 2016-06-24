class CreateBios < ActiveRecord::Migration[5.0]
  def change
    create_table :bios do |t|
      t.text :bio

      t.timestamps
    end
  end
end
