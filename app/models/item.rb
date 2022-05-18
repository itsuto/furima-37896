class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image, dependent: :destroy
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :delibery_burden
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_date

  validates :name, presence: true, length: { maximum: 40 }
  validates :info, presence: true, length: { maximum: 1000 }
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :delibery_burden_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_date_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :price, presence: true, inclusion: { in: 300..9_999_999 }, numericality: { only_integer: true }
  validates :image, presence: true
end
