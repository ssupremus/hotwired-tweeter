# frozen_string_literal: true

# bind users to tweets
class BindUsersToTweets < ActiveRecord::Migration[6.1]
  def change
    create_tweets
    create_comments
    create_likes
  end

  private

  def create_tweets
    create_table :tweets do |t|
      t.bigint :original_tweet_id
      t.references :user
      t.timestamps
    end
  end

  def create_comments
    create_table :comments do |t|
      t.bigint :commentable_id
      t.string :commentable_type
      t.references :user
      t.timestamps
    end
  end

  def create_likes
    create_table :likes do |t|
      t.bigint :likeable_id
      t.string :likeable_type
      t.references :user
      t.timestamps
    end
  end
end
