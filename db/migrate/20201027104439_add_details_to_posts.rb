class AddDetailsToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :content, :text

    add_index :posts, [:user_id, :created_at]
  end
end
