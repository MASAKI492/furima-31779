class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  validates :category_id, numericality: { other_than: 1 } 
  
  has_one_attached :image

  validates :name,                  presence:true
  validates :info,                  presence:true
  validates :category_id,           presence:true
  validates :sales_status_id,       presence:true
  validates :price,                 presence:true
  validates :shipping_fee_status_id,presence:true
  validates :scheduled_delivery_id, presence:true
  validates :prefecture_id,         presence:true
  
  belongs_to :user
  has_one    :credit
  
end
