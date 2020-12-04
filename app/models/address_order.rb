class AddressOrder
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number, :token

  with_options presence: true do
  validates :postal_code, format: {with: /\d{3}-\d{4}/, message: "は( - )をお入れください"}
  validates :city
  validates :addresses
  validates :phone_number, format: {with: /\A\d{10,11}\z/, message: "は半角英数でご入力ください"}
   validates :prefecture_id, numericality: { other_than: 1, message:"は[--]以外をお選びください" }
   validates :token

   
  end
   
  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, addresses: addresses, building: building, phone_number: phone_number,order_id: order.id)
  end
end 



