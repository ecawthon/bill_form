class RemoveUnameFromCreditCards < ActiveRecord::Migration
  def up
    remove_column :credit_cards, :uname
  end

  def down
    add_column :credit_cards, :uname, :string
  end
end
