# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table "users", id: :bigserial do |t|
      t.string :username
      t.string :password_digest

      t.timestamps
    end
  end
end
