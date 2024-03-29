class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items, dependent: :destroy

  enum payment_method: { 銀行振込: 0, クレジットカード: 1 }
  enum order_status: { 入金待ち: 0, 入金確認: 1, 製作中: 2, 発送準備中: 3, 発送済み: 4 }
  scope :created_today, -> { where("created_at >= ?", Time.zone.now.beginning_of_day) }

  validates :address, presence: true
  validates :payment, presence: true, numericality: true
  validates :postage, presence: true, numericality: true
end
