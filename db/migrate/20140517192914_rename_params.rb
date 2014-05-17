class RenameParams < ActiveRecord::Migration
  def change
    change_column :orders, :params, :text
  end
end

