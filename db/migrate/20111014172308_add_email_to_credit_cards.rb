class AddEmailToCreditCards < ActiveRecord::Migration
  def change
    add_column :credit_cards, :email, :string
  end
end
