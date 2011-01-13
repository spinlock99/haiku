class AddMicropostLines < ActiveRecord::Migration
  def self.up
    add_column :microposts, :line0, :text
    add_column :microposts, :line1, :text
    add_column :microposts, :line2, :text
  end

  def self.down
    remove_column :microposts, :line0
    remove_column :microposts, :line1
    remove_column :microposts, :line2
  end
end
