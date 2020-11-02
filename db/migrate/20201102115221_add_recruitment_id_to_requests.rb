class AddRecruitmentIdToRequests < ActiveRecord::Migration[6.0]
  def change
    add_column :requests, :recruitment_id, :integer

    add_index :requests, [:user_id, :recruitment_id]
  end
end
