class AddPrefectureIdToRecruitments < ActiveRecord::Migration[6.0]
  def change
    add_column :recruitments, :prefecture_id, :integer
  end
end
