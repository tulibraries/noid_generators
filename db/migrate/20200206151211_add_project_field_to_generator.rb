class AddProjectFieldToGenerator < ActiveRecord::Migration[5.2]
  def change
    add_column :generators, :project, :string
  end
end
