# frozen_string_literal: true

require "csv"

namespace :noids do
  desc "Backfill project-level NOID counters from a CSV file"
  task :backfill_project_counters, [:file] => :environment do |_task, args|
    csv_path = args[:file]
    abort "Usage: bundle exec rake \"noids:backfill_project_counters[path/to/backfill.csv]\"" unless csv_path.present?

    rows = CSV.read(csv_path, headers: true)

    ActiveRecord::Base.transaction do
      rows.each do |row|
        project_id = row["project_id"].presence || raise("Missing project_id for row #{row.inspect}")
        project = Project.find_by(id: project_id) || raise("Project #{project_id} not found")

        last_noid = row["last_noid"].presence || raise("Missing last_noid for project #{project_id}")
        month = row["month"].presence || raise("Missing month for project #{project_id}")

        project.update!(noid: last_noid.to_i, last_date: month)
      end
    end

    puts "Processed #{rows.length} rows from #{csv_path}"
  end
end
