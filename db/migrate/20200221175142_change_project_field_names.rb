# frozen_string_literal: true

class ChangeProjectFieldNames < ActiveRecord::Migration[5.2]
  def change
    rename_column :projects, :label, :nolabel
    rename_column :projects, :name, :label
    rename_column :projects, :nolabel, :name
  end
end
