# frozen_string_literal: true

class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects, id: :bigserial do |t|
      t.string :name
      t.string :code
      t.string :prefix
      t.string :suffix
      t.string :label

      t.timestamps
    end
  end
end
