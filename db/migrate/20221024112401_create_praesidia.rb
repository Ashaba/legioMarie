class CreatePraesidia < ActiveRecord::Migration[7.0]
  def change
    create_table :praesidia do |t|
      t.string :name
      t.string :parish
      t.date :date_created
      t.references :curia, null: false, foreign_key: true

      t.timestamps
    end
  end
end
