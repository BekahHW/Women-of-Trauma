class CreateUserDisorderTreatments < ActiveRecord::Migration[5.2]
  def change
    create_table :user_disorder_treatments do |t|
      t.integer :user_disorder_id
      t.integer :treatment_id

      t.timestamps
    end
  end
end
