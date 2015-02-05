class AddContactToPromo < ActiveRecord::Migration
  def change
    add_column :promos, :contact, :string
  end
end
