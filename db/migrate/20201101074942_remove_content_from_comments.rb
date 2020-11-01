class RemoveContentFromComments < ActiveRecord::Migration[6.0]
  def up
    remove_column :comments, :content, :string
  end
  def down
    add_column :comments, :content, :text
  end
end
