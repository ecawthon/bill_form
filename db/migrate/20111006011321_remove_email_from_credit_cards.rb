class RemoveEmailFromCreditCards < ActiveRecord::Migration
  def up
    remove_column :credit_cards, :email
  end

  def down
    add_column :credit_cards, :email, :string
  end
end
