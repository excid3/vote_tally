class CreatePolls < ActiveRecord::Migration[5.2]
  def change
    create_table :polls do |t|
      t.belongs_to :riding, foreign_key: true
      t.integer :number

      t.timestamps
    end
  end
end
