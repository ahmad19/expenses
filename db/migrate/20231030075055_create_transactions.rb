class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.jsonb :data, null: false, default: {}
      t.string :month, null: false
      t.string :year, null: false
      t.timestamps
    end
  end
end
