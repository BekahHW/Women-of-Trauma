class CreateTreatments < ActiveRecord::Migration[5.2]
  def change
    create_table :treatments do |t|
      t.string :therapy_name
      t.string :med_name
      t.string :med_dosage
      t.text :comments

      t.timestamps
    end
  end
end
