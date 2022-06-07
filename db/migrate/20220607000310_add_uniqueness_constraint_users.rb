# frozen_string_literal: true

class AddUniquenessConstraintUsers < ActiveRecord::Migration[7.0]
  def change
    add_index :users, %i[email username], unique: true
  end
end
