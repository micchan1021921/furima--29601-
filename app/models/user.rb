class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
         
         #ニックネームが必須であること
         validates :nickname, presence: true
         #メールアドレスが必須であること
         validates :email, presence: true
         #メールアドレスが一意性であること
         validates :email, uniqueness: true
         #パスワードが必須であること
         validates :password, presence: true
         #パスワードは6文字以上であること
         validates :password, length: { minimum: 6 }
         #パスワードは半角英数字混合であること
         VALID_PASSWORD_REGEX = /\A[a-z0-9]+\z/i
         validates :password, format: { with: VALID_PASSWORD_REGEX } 
         #パスワードは確認用を含めて2回入力すること
         
         #ユーザー本名が、名字と名前がそれぞれ必須であること
         validates :last_name, presence: true
         validates :first_name, presence: true
         #ユーザー本名は全角（漢字・ひらがな・カタカナ）で入力させること
         #validates :last_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/i }
         validates :last_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/i } 
         validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/i} 
         #ユーザー本名のフリガナが、名字と名前でそれぞれ必須であること
         validates :last_name_kana, presence: true
         validates :first_name_kana, presence: true
         #ユーザー本名のフリガナは全角（カタカナ）で入力させること
         validates :last_name_kana, format: { with: /\A[ァ-ヶ]+\z/i} 
         validates :first_name_kana, format: { with: /\A[ァ-ヶ]+\z/i } 
         #生年月日が必須であること
         validates :birth_date, presence: true
        end
