# frozen_string_literal: true

desc 'Release Phase is executed by Heroku when releasing new code'

task release_phase: :environment do
  Rake::Task['db:migrate'].invoke
end
