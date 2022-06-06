class AddCheckConstraintForUserEmail < ActiveRecord::Migration[7.0]
  def change
    add_check_constraint :users, "email <> ''", name: "email_check"
  end
end
