class User < ApplicationRecord
has_secure_password
has_many :articles
validates :username, presence: true
validates :email, presence: true
validates :password, presence: true
validates :password, confirmation: { case_sensitive: true }

end
