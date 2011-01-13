class DropContentFromMicroposts < ActiveRecord::Migration
  def self.up
    remove_column :microposts, :content
  end

  def self.down
    add_column :microposts, :content, :string
  end
end
