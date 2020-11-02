class CreateRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :requests do |t|
      t.string :name
      t.string :group_name
      t.text :content
      t.integer :user_id
      t.integer :post_id
      t.timestamps
    end
  end
end
