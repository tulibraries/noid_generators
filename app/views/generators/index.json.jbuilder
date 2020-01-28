# frozen_string_literal: true

json.array! @generators, partial: "generators/generator", as: :generator
