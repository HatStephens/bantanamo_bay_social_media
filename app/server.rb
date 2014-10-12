require 'sinatra'
require 'data_mapper'

require_relative 'models/bant'

env = ENV["RACK_ENV"] || "development"

DataMapper.setup(:default, "postgres://localhost/bantanamo_bay_#{env}")


DataMapper.finalize


DataMapper.auto_upgrade!

get '/' do
	@bants = Bant.all
	erb :index
end