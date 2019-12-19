require_relative '../extensions/task/output.rb'
extend Task::Output
# require 'dbf'

namespace :import do

  # `bundle exec rails import:all`
  desc "Импортировать КЛАДР из файлов"
  task all: :environment do |t, args|
    output t do
      Rake::Task['import:street'].invoke
    end
  end

  # `bundle exec rails import:street`
  desc "Импортировать улицы из файла streets.dbf"
  task street: :environment do |t, args|
    output t do
      ActiveRecord::Schema.define do
        drop_table :streets, if_exists: true
      end

      file_path = Rails.root.join 'tmp', 'kladr', 'streets.dbf'
      # print 'file_path: '.red; puts file_path

      table = DBF::Table.new(file_path, nil, 'cp866')
      # print 'table.schema: '.red; puts table.schema
      eval(table.schema)

      Street.reset_column_information

      # model_hash = table.first.attributes
      # model_hash = Hash[model_hash.map{|k,v|[k.downcase,v]}]
      # print 'model_hash: '.red; puts model_hash

      table.each do |record|
        model_hash = Hash[record.attributes.map{|k,v|[k.downcase,v]}]
        # print 'model_hash: '.red; puts model_hash
        # exit 0
        # byebug
        Street.create model_hash
      end
    end
  end
end
