class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
         
         with_options presence: true do
         validates :nickname
         validates :email, uniqueness: true
         VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}+\z/i
         validates :password, format: { with: VALID_PASSWORD_REGEX } 
         validates :birth_date
         validates :last_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/i }
         validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/i }
         validates :last_name_kana, format: { with: /\A[ァ-ヶ]+\z/i }
         validates :first_name_kana, format: { with: /\A[ァ-ヶ]+\z/i }
         end
        end
