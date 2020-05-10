class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :mailing_addresses, dependent: :destroy

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
