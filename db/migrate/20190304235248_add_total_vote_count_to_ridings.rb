class AddTotalVoteCountToRidings < ActiveRecord::Migration[5.2]
  def self.up
    add_column :ridings, :liberal_vote_count, :integer, null: false, default: 0
    add_column :ridings, :conservative_vote_count, :integer, null: false, default: 0
    add_column :ridings, :ndp_vote_count, :integer, null: false, default: 0
    add_column :ridings, :green_vote_count, :integer, null: false, default: 0
    add_column :ridings, :peoples_vote_count, :integer, null: false, default: 0
  end

  def self.down
    remove_column :ridings, :liberal_vote_count
    remove_column :ridings, :conservative_vote_count
    remove_column :ridings, :ndp_vote_count
    remove_column :ridings, :green_vote_count
    remove_column :ridings, :peoples_vote_count
  end
end
