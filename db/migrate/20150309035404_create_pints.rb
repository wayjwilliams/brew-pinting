class CreatePints < ActiveRecord::Migration
  def change
    create_table :pints do |t|
      t.string :description

      t.timestamps null: false
    end
  end
end
