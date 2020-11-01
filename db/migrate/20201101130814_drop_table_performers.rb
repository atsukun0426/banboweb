class DropTablePerformers < ActiveRecord::Migration[6.0]
  def change
    drop_table :performers
  end
end
