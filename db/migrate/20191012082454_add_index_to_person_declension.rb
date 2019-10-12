class AddIndexToPersonDeclension < ActiveRecord::Migration[6.0]
  def change
    add_index :person_declensions, [:person_id, :name_case], unique: true
  end
end
