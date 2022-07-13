class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.integer :member_id

      t.string  :is_type
      t.string  :street_1
      t.string  :street_2
      t.string  :city
      t.string  :state
      t.string  :zipcode

      t.timestamps
    end
  end
end
