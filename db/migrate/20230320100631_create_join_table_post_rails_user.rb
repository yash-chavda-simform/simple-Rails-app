class CreateJoinTablePostRailsUser < ActiveRecord::Migration[7.0]
  def change
    create_join_table :posts, :rails_users do |t|
      t.index [:post_id, :rails_user_id], unique: true
      # t.index [:rails_user_id, :post_id]
    end
  end
end
