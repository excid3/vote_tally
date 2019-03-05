class AddVoteTotalToRiding < ActiveRecord::Migration[5.2]
  def change
    add_column :ridings, :total_vote_count, :integer, null: false, default: 0
  end
end
