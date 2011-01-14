class AddPortfolioManagerToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :portfolio_manager, :boolean, :default => false
  end

  def self.down
    remove_column :users, :portfolio_manager
  end
end
