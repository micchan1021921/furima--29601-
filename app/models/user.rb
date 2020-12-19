class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
         
         with_options presence: true do
         validates :nickname
         validates :email, uniqueness: true
         VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}+\z/i
         validates :password, confirmation: true, format: { with: VALID_PASSWORD_REGEX } 
         validates :birth_date
         with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/i } do
         validates :last_name
         validates :first_name
         end
         with_options format: { with: /\A[ァ-ヶ]+\z/i } do
         validates :last_name_kana
         validates :first_name_kana
         end

         end

        end
