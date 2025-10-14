# frozen_string_literal: true

class AddCounterFieldsToProjects < ActiveRecord::Migration[7.0]
  def change
    add_column :projects, :noid, :integer, default: 0, null: false
    add_column :projects, :last_date, :string, limit: 2
  end
end

