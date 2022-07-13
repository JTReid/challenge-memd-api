class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.string :first_name
      t.string :last_name
      t.string :account_status

      t.boolean :has_dependents

      t.timestamps
    end
  end
end
