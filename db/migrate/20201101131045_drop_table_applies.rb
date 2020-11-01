class DropTableApplies < ActiveRecord::Migration[6.0]
  def change
    drop_table :applies
  end
end
