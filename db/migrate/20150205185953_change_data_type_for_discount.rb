class ChangeDataTypeForDiscount < ActiveRecord::Migration
  def change
  	change_column(:promos, :discount, :string)
  end
end
