# frozen_string_literal: true

json.extract! generator, :id, :name, :created_at, :updated_at
json.url generator_url(generator, format: :json)
