class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  t.string :name, null: false
  t.text :info, null: false
  t.integer :category_id, null: false
  t.integer :condition_id, null: false
  t.integer :delibery_burden_id, null: false
  t.integer :prefecture_id, null: false
  t.integer :date_id, null: false
  t.integer :price, null: false
  t.references :user, null: false, foreign_key: true
end