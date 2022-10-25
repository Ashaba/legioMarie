class CreateMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :members do |t|
      t.string :first_name
      t.string :last_name
      t.string :parish
      t.string :mobile
      t.string :membership_type
      t.date :birthday
      t.date :date_joined
      t.references :praesidium, null: false, foreign_key: true

      t.timestamps
    end
  end
end
