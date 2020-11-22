class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください' } do

  validates :nickname, presence: true
  with_options presence: true do
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :first_name,      format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :last_name_kana,  format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :password,        format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}+\z/i }
  end
  validates :birth_date, presence: true

  # VALID_PASSWORD_REGIX = /\A[a-z0-9]+\z/i
  # validates :password, format: { with: VALID_PASSWORD_REGIX }
end
