class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true
  validates :email, uniqueness: true
  validates :password, confirmation: true, length: {minimum: 6}
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: "Password Include both letters and numbers" 
  WIDTH_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/
  with_options presence: true, format: { with: WIDTH_REGEX, message: 'Full-width characters' } do
    validates :family_name
    validates :first_name
  end
  WIDTH_KATAKANA_REGEX = /\A[ァ-ン一]+\z/
  with_options presence: true, format: { with: WIDTH_KATAKANA_REGEX, message: 'Full-width katakana characters' } do
    validates :family_name_kana
    validates :first_name_kana
  end
  validates :birth_date, presence: true
end
 
    