class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i,
                                 message: 'is invalid. Include both letters and numbers' }

  with_options presence: true do
    validates :nickname
    validates :family_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/,
                                      message: 'is invalid. Input full-width characters.' }
    validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/,
                                     message: 'is invalid. Input full-width characters.' }
    validates :family_name_kana, format: { with: /\A[ァ-ヶー]+\z/,
                                           message: 'is invalid. Input full-width katakana characters.' }
    validates :first_name_kana, format: { with: /\A[ァ-ヶー]+\z/,
                                          message: 'is invalid. Input full-width katakana characters.' }
    validates :birth_date
  end

  has_many :items
  has_many :orders
end
