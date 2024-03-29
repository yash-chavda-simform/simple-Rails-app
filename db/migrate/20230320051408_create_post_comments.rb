class CreatePostComments < ActiveRecord::Migration[7.0]
  def change
    create_table :post_comments do |t|
      t.string :comment
      t.references :rails_user, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
