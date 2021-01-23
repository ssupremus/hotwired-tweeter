# frozen_string_literal: true

# user model
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :avatar
  has_many :tweets, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes
  has_many :notifications, as: :notifiable
  has_many :subscriptions, dependent: :destroy
  validates :name, presence: true
  validates :username, presence: true, uniqueness: true
end
