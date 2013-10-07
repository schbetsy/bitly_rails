class User < ActiveRecord::Base
  validates :email, format: { with: /\S{2,}@\S{2,}\.\S{2,}/ }
  validates :email, presence: true, uniqueness: true

  has_many :urls

  # include BCrypt

end
