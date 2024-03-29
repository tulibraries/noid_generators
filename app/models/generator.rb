# frozen_string_literal: true

class Generator < ApplicationRecord
  has_many :projects, dependent: :destroy
  validates :name, presence: true
end
