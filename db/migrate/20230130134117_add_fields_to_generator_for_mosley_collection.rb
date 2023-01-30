class AddFieldsToGeneratorForMosleyCollection < ActiveRecord::Migration[6.1]
  def change
    add_column :generators, :picture_code, :string
    add_column :generators, :date_taken, :string
  end
end
