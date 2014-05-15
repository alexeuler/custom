class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :string
      t.text :comments
      t.string :params

      t.timestamps
    end
  end
end
