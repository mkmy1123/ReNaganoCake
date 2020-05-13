class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

  has_many :orders, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :mailing_addresses, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :kana_first_name, presence: true
  validates :kana_last_name, presence: true
  validates :postcode, presence: true, length: {maximum: 7, minimum: 7}, numericality: true
  validates :address, presence: true
  validates :phone_number, presence: true, length: {maximum: 11, minimum: 10}, numericality: true

  def name
    first_name + last_name
  end


  def active_for_authentication? #認証されている会員ですよーという定義
    super && (self.is_valid == true )
  end

  def addresses
    postcode + address + name
  end

end
