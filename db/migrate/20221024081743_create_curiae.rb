class CreateCuriae < ActiveRecord::Migration[7.0]
  def change
    create_table :curiae do |t|
      t.string :name
      t.string :location
      t.date :date_created

      t.timestamps
    end
  end
end
