class LineFood < ApplicationRecord
  belongs_to :food
  belongs_to :restaurant
  belongs_to :order, optional: true

  validates :count, numericality: { greater_than: 0 }

  #activeカラムがtrueのレコードのみが対象
  scope :active, -> { where(active: true) }
  #特定の店舗IDではないもののみ対象、（）は引数:特定の店舗ID
  scope :other_restaurant, -> (picked_restaurant_id) { where.not(restaurant_id: picked_restaurant_id) }

  #controllerではなくmodelにインスタンスメソッド定義することで、様々な箇所から呼び出すことができる
  def total_amount
    food.price * count
  end
end
