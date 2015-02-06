class AddUserIdToPromos < ActiveRecord::Migration
  def change
    add_reference :promos, :user, index: true
  end
end
