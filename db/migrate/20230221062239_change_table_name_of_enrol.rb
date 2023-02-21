class ChangeTableNameOfEnrol < ActiveRecord::Migration[7.0]
  def change
    rename_table :enrols, :users_events
  end
end
