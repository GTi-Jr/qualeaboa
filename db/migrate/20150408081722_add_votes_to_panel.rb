class AddVotesToPanel < ActiveRecord::Migration
  def change
    add_column :panels, :vote, :integer
  end
end
