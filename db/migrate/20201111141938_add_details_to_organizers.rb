class AddDetailsToOrganizers < ActiveRecord::Migration[6.0]
  def change
    add_column :organizers, :name, :string
    add_column :organizers, :description, :text
    add_column :organizers, :image, :string
  end
end
