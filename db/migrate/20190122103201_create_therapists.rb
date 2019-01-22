class CreateTherapists < ActiveRecord::Migration[5.2]
  def change
    create_table :therapists do |t|
      t.string :name
      t.string :location
      t.integer :phone_number

      t.timestamps
    end
  end
end
