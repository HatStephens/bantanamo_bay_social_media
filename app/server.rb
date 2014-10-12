require 'sinatra'
require 'data_mapper'
require 'rack-flash'

require_relative 'data_mapper_setup'
require_relative 'helpers/application'

require_relative 'models/bant'
require_relative 'models/user'

enable :sessions
set :session_secret, 'super secret'
use Rack::Flash

get '/' do
	@bants = Bant.all
	erb :index
end

get '/users/new' do
	@user = User.new
	erb :"users/new"
end

post '/users' do
	@user = User.create(email: params[:email], name: params[:name], username: params[:username], password: params[:password], password_confirmation: params[:password_confirmation])
	
	if @user.save
		session[:user_id] = @user.id
		redirect to '/'
	else
		flash.now[:errors] = @user.errors.full_messages
		erb :"users/new"
	end
end

get '/sessions/new' do
	erb :"sessions/new"
end

post '/sessions' do
	username = params[:username]
	password = params[:password]
	user = User.authenticate(username, password)
	if user
		session[:user_id] = user.id
		redirect to '/'
	else
		flash[:errors] = ["Your username or password do not match, please try again."]
		erb :"sessions/new"
	end
end

