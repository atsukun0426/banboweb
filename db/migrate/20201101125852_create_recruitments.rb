class CreateRecruitments < ActiveRecord::Migration[6.0]
  def change
    create_table :recruitments do |t|
      t.string   :title
      t.text   :content
      t.datetime :date, null: false
      t.integer  :price
      t.timestamps
    end
  end
end
