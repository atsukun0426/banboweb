class AddMujicToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :music, :string
  end
end
