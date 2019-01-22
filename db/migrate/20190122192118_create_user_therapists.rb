class CreateUserTherapists < ActiveRecord::Migration[5.2]
  def change
    create_table :user_therapists do |t|
      t.string :name
      t.string :location
      t.integer :therapist_id
      t.integer :user_id

      t.timestamps
    end
  end
end
