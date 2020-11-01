class AddColumnToComments < ActiveRecord::Migration[6.0]
  def change
    add_column  :comments, :content, :string

    add_index :comments, [:user_id]
    add_index :comments, [:post_id]
  end
end
