class Order < ActiveRecord::Base
  belongs_to :mushroom

  validates :mushroom_id, presence: true
  validates :user_name, presence: true
  validates :user_address, presence: true
  validates :payment_info, presence: true
  validates :order_date, presence: true
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
end