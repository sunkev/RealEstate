class CreateTenant < ActiveRecord::Migration
  def change
    create_table :tenants do |t|
      t.integer :building_id
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email, null: false

    end
  end
end
