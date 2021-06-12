class AddSlackInfosToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :slack_id, :string
    add_column :users, :slack_name, :string
    add_column :users, :slack_real_name, :string
  end
end
