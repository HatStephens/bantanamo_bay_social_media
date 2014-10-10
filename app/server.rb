require 'data_mapper'

env = ENV["RACK_ENV"] || "development"

DataMapper.setup(:default, "postgres://localhost/bantanamo_bay_#{env}")

require './app/models/bants.rb'


DataMapper.finalize


DataMapper.auto_upgrade!