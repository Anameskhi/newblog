class User < ApplicationRecord

  has_many :articles
  has_many :comments
validates :username, presence: true
validates :email, presence: true
validates :password, presence: true
validates :password, confirmation: { case_sensitive: true }

end
