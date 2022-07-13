class CreateMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :members do |t|
      t.integer :account_id

      t.string  :first_name
      t.string  :last_name
      t.string  :gender
      t.string  :relationship

      t.date    :dob

      t.timestamps
    end
  end
end
