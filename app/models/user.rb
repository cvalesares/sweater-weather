class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  validates_presence_of :password, require: true
  validates :api_key, uniqueness: true, presence: true

  has_secure_password

  def self.generate_api_key
    (0...50).map { ('a'..'z').to_a[rand(26)] }.join
  end
end
