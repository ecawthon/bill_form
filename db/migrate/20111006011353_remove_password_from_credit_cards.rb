class RemovePasswordFromCreditCards < ActiveRecord::Migration
  def up
    remove_column :credit_cards, :password
  end

  def down
    add_column :credit_cards, :password, :string
  end
end
