# frozen_string_literal: true

require "rubocop/rake_task"

RuboCop::RakeTask.new

task default: :run

desc "Run all scenarios (eq to bundle exec quke)"
task :run do
  sh %( bundle exec quke )
end

desc "Runs the tests used by continuous integration to check the project"
task :ci do
  Rake::Task["rubocop"].invoke
  sh %( QUKE_CONFIG=config/ci.config.yml exec quke --tags @ci )
end
