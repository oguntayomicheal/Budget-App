# frozen_string_literal: true

class RenameUsersIdToUserIdInCategories < ActiveRecord::Migration[7.0]
  def change
    rename_column :categories, :users_id, :user_id
  end
end
