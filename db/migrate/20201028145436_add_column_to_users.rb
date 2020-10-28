class AddColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column  :users, :organizer, :boolean, default: false, null: false
  end
end
