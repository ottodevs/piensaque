class CreateFollow < ActiveRecord::Migration
  def change
    drop_table :relations_tables

    create_table :relations do |t|
      t.integer :user_id
      t.integer :user_relation_id

      t.timestamps
    end

    rename_column :users, :following, :following_count
    rename_column :users, :followers, :followers_count

  end
end