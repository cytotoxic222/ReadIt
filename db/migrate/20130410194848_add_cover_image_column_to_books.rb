class AddCoverImageColumnToBooks < ActiveRecord::Migration
  def change
    add_column :books, :cover_image, :string
  end
end
