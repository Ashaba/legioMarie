class AddGenderToMember < ActiveRecord::Migration[7.0]
  def change
    add_column :members, :gender, :string
  end
end
