class RemoveAvatarColumnFromAdmins < ActiveRecord::Migration
  def up
    remove_column :admins, :avatar
  end

  def down
    add_column :admins, :avatar, :string
  end
end
