class AddNameToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :name, :text, default: "Anonymous"
  end
end
