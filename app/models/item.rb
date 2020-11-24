class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  validates :category_id, numericality: { other_than: 1 } 
  
  has_one_attached :image

  with_options presence: true do
  validates :name                 
  validates :info                  
  validates :category_id           
  validates :sales_status_id    
  validates :price                  ,format: {with: /\A[0-9]+\z/},inclusion: { in: (300..9999999)}
  validates :shipping_fee_status_id            
  validates :scheduled_delivery_id
  validates :prefecture_id
  end
  belongs_to :user
  has_one    :credit
  
end
