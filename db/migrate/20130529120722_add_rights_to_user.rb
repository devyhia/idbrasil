class AddRightsToUser < ActiveRecord::Migration
  def self.up
    add_column("users", "rights", :string)
  end
end
