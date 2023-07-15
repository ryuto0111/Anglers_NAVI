class ChangeColumnToNull < ActiveRecord::Migration[6.1]
  def up
    change_column_null :users, :introduction, true
    change_column_null :posts, :admin_id, true
  end

  def down
    change_column_null :users, :introduction, false
    change_column_null :posts, :admin_id, false
  end
end
