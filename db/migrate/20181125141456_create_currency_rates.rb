class CreateCurrencyRates < ActiveRecord::Migration[5.1]
  def change
    create_table :currency_rates do |t|
      t.decimal :sell, precision: 8, scale: 2
      t.decimal :buy, precision: 8, scale: 2 
      t.string :currency

      t.timestamps
    end
  end
end
