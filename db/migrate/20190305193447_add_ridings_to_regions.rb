class AddRidingsToRegions < ActiveRecord::Migration[5.2]
  def change
    add_reference :ridings, :region, foreign_key: true
  end
end
