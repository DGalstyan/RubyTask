# User Model
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # Devise is a flexible authentication solution for Rails
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def guest?
    role == 'guest' # check roles
  end

  def admin?
    role == 'admin' # check roles
  end
end
