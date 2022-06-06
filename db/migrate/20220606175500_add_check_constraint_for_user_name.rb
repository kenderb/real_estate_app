class AddCheckConstraintForUserName < ActiveRecord::Migration[7.0]
  def change
    add_check_constraint :users, "name <> ''", name: "name_check"
  end
end
