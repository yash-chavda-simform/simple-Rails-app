class AddRoleToUserRendering < ActiveRecord::Migration[7.0]
  def change
    add_column :user_renderings, :role, :string
  end
end
