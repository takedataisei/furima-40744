class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  belongs_to :item_condition
  belongs_to :shipping_cost_burden
  belongs_to :prefecture
  belongs_to :shipping_day

  belongs_to :user

  has_one_attached :image

  validates :name, :item_detail, :image, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :genre_id
    validates :item_condition_id
    validates :shipping_cost_burden_id
    validates :prefecture_id
    validates :shipping_day_id
  end
end
