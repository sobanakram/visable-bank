class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.references :by_user
      t.references :to_user
      t.float :amount, null: false

      t.timestamps
    end
  end
end
