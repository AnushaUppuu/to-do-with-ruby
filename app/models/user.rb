class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         :timeoutable

  has_many :tasks, dependent: :destroy
end

