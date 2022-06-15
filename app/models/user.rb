class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :ingredient_pantries
  has_many :favorite_recipes
  has_many :recipes, through: :favorite_recipes
  has_many :tasks

  has_many :favorite_recipes
  has_many :recipes, through: :favorite_recipes

  has_many :tasks

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :photo

  validates :phone, presence: true
end
