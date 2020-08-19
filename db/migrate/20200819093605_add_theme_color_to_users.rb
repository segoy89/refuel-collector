class AddThemeColorToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :theme_color, :integer, default: 0
  end
end
