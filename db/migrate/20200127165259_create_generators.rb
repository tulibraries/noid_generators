# frozen_string_literal: true

class CreateGenerators < ActiveRecord::Migration[5.2]
  def change
    create_table :generators, id: :bigserial do |t|
      t.string :name
      t.string :last_date
      t.string :prefix
      t.string :suffix
      t.string :class_code
      t.integer :noid

      t.timestamps
    end
  end
end
