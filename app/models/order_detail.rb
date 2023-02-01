class OrderDetail < ApplicationRecord
  belongs_to :item
  belongs_to :order
  enum making_status: { cannot_be_produced: 0, awaiting_production: 1, under_manufacture: 2, production_completed: 3 }

  def subtotal
    price * amount
  end

end
