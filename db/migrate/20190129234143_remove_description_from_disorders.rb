class RemoveDescriptionFromDisorders < ActiveRecord::Migration[5.2]
  def change
    remove_column :disorders, :description
  end
end
