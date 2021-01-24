# frozen_string_literal: true

# user model
class User < ApplicationRecord
  include ActionText::Attachable
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

  def to_trix_content_attachment_partial_path
    to_partial_path
  end
end
