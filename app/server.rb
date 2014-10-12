require 'sinatra'
require 'data_mapper'

require_relative 'data_mapper_setup'
require_relative 'helpers/application'

require_relative 'models/bant'
require_relative 'models/user'

enable :sessions
set :sessions_secret, 'super secret'

get '/' do
	@bants = Bant.all
	erb :index
end

get '/users/new' do
	erb :"users/new"
end

post '/users' do
	user = User.create(email: params[:email], name: params[:name], username: params[:username], password: [:password])
	session[:user_id] = user.id
	redirect to '/'
end

