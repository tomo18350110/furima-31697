class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :comments
  has_many :purchases

  with_options presence: true, format: { with: /\A[ぁ-んァ-ンー-龥]+\z/, message: '全角文字を使用してください'} do
    validates :first_name
    validates :last_name
  end

  with_options presence: true, format: { with: /\A[ァ-ンー]+\z/, message: '全角カナを使用してください'} do
    validates :first_name_kana
    validates :last_name_kana
  end
    
  validates :nickname,  presence: true, length: { maximum: 40 }
  validates :birthday, presence: true
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/.freeze
  validates :password, presence: true, length: { minimum: 6, maximum: 32 }, format: { with: VALID_PASSWORD_REGEX }
  validates :email, uniqueness: true
end
