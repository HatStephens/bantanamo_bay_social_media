require './app/models/bant'
require './app/models/user'

env = ENV["RACK_ENV"] || "development"

DataMapper.setup(:default, "postgres://localhost/bantanamo_bay_#{env}")


DataMapper.finalize


DataMapper.auto_upgrade!