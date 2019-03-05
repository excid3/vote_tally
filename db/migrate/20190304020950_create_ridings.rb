class CreateRidings < ActiveRecord::Migration[5.2]
  def change
    create_table :ridings do |t|
      t.integer :number
      t.string :name
      t.string :province
      t.integer :eligible_voters
      t.integer :win_number

      t.timestamps
    end
  end
end
