# frozen_string_literal: true

# bind users to tweets
class BindUsersToTweets < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :username, :string
    add_column :users, :name, :string
    add_column :tweets, :user_id, :integer
    remove_column :tweets, :likes_count, :integer
    remove_column :tweets, :retweets_count, :integer
    create_comments
    create_likes
  end

  private

  def create_comments
    create_table :comments do |t|
      t.references :tweet
      t.references :user
      t.string :body
      t.timestamps
    end
  end

  def create_likes
    create_table :likes do |t|
      t.string :type
      t.references :user
      t.references :tweet
      t.references :comment
      t.timestamps
    end
  end
end
