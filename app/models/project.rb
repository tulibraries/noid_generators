# frozen_string_literal: true

class Project < ApplicationRecord
  belongs_to :generator
  validates :name, :label, presence: true
end
