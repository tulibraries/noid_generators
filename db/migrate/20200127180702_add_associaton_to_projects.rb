# frozen_string_literal: true

class AddAssociatonToProjects < ActiveRecord::Migration[5.2]
  def change
    change_table :projects do |t|
      t.belongs_to :generator
    end
  end
end
