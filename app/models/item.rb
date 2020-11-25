class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :prefecture
  belongs_to :sales_status
  belongs_to :scheduled_delivery
  belongs_to :shipping_fee_status
  
  
  has_one_attached :image

  with_options presence: true do
  validates :image  
  validates :name                 
  validates :info                  
  validates :category_id            ,numericality: { other_than: 1 }
  validates :sales_status_id        ,numericality: { other_than: 1 }
  validates :price                  ,format: {with: /\A[0-9]+\z/},inclusion: { in: (300..9999999)}
  validates :shipping_fee_status_id ,numericality: { other_than: 1 }          
  validates :scheduled_delivery_id  ,numericality: { other_than: 1 }
  validates :prefecture_id          ,numericality: { other_than: 1 }
  end
  belongs_to :user
  has_one    :credit
  
end
