class CreatePersonDeclensions < ActiveRecord::Migration[6.0]
  def change
    create_table :person_declensions do |t|
      t.references :person, null: false, foreign_key: true
      t.string :name_case
      t.string :first_name
      t.string :last_name
      t.string :middle_name
      t.string :full_name

      t.timestamps
    end
  end
end
