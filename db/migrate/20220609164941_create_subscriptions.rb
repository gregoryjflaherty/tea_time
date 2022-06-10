class CreateSubscriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :subscriptions do |t|
      t.belongs_to :customer, null: false, foreign_key: true
      t.belongs_to :tea, null: false, foreign_key: true
      t.string :title
      t.integer :price
      t.string :status, default: "active"
      t.integer :frequency

      t.timestamps
    end
  end
end
