class AddToUseridToRecruitments < ActiveRecord::Migration[6.0]
  def change
    add_column :recruitments, :user_id, :integer

    add_index :recruitments, [:user_id, :created_at]
  end
end
