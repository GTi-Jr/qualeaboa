class CreatePanels < ActiveRecord::Migration
  def change
    create_table :panels do |t|
      t.string :title
      t.text :description
      t.string :actor

      t.timestamps
    end
  end
end
