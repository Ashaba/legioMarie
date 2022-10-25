class AddMembersCountToPraesidium < ActiveRecord::Migration[7.0]
  def change
    add_column :praesidia, :members_count, :integer
  end
end
