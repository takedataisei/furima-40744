class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :tel_number, :prefecture_id,
                :city, :address_line, :building_name, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :tel_number, length: { minimum: 10, maximum: 11 },
                           numericality: { only_integer: true, message: 'Input only number' }
    validates :city
    validates :address_line
    validates :token
  end
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, tel_number: tel_number, prefecture_id: prefecture_id, city: city,
                   address_line: address_line, building_name: building_name, order_id: order.id)
  end
end
