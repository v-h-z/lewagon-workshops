class AddCampSlugToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :camp_slug, :string
  end
end
