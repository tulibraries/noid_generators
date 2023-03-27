class AddLockVersionToGenerators < ActiveRecord::Migration[6.1]
  def change
    add_column :generators, :lock_version, :integer
  end
end
