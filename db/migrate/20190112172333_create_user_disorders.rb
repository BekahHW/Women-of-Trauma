class CreateUserDisorders < ActiveRecord::Migration[5.2]
  def change
    create_table :user_disorders do |t|
      t.text :narrative
      t.integer :user_id
      t.integer :disorder_id

      t.timestamps
    end
  end
end
