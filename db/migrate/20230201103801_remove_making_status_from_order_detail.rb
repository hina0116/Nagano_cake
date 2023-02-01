class RemoveMakingStatusFromOrderDetail < ActiveRecord::Migration[6.1]
  def change
    remove_column :order_details, :making_status, :boolean
  end
end
