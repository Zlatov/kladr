require_relative '../extensions/task/output.rb'
extend Task::Output

namespace :import do

  # $ bundle exec rails import:all
  desc "Импортировать КЛАДР из файлов"
  task all: :environment do |t, args|
    output t do
      puts 'message'.green
      # Rake::Task['book'].invoke # invoke запускает с зависимыми задачами
    end
  end
end
