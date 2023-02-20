class ChangeColumnname < ActiveRecord::Migration[7.0]
  def change
    rename_column :events, :user_id, :organizer_id
  end
end
