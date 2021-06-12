class AddNicknameToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :github_nickname, :string
  end
end
