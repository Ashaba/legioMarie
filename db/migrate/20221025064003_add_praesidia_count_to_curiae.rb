class AddPraesidiaCountToCuriae < ActiveRecord::Migration[7.0]
  def change
    add_column :curiae, :praesidia_count, :integer
  end
end
