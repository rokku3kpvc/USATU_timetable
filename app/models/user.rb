class User < ApplicationRecord
  # :confirmable, :lockable, :recoverable, :timeoutable, :trackable, :registerable and :omniauthable
  devise :database_authenticatable, :rememberable, :validatable
  enum role: %I[simple admin]
end
