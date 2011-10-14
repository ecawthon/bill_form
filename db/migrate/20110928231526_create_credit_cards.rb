class CreateCreditCards < ActiveRecord::Migration
  def change
    create_table :credit_cards do |t|
      t.string :cardholder
      t.string :number
      t.string :expiration
      t.string :code
      t.string :company
      t.string :uname
      t.string :password

      t.timestamps
    end
  end
end
