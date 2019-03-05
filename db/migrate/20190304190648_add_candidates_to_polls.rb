class AddCandidatesToPolls < ActiveRecord::Migration[5.2]
  def change
    add_column :polls, :candidate_one, :integer, :null => false, :default => 0
    add_column :polls, :candidate_two, :integer, :null => false, :default => 0
    add_column :polls, :candidate_three, :integer, :null => false, :default => 0
    add_column :polls, :candidate_four, :integer, :null => false, :default => 0
  end
end
