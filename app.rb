# third-party dependency
require 'sinatra'
require 'sinatra/reloader' if development?
require 'dm-core'
require 'dm-migrations'
require 'dm-timestamps'
# files in project
require './models/student'
require './controllers/student_controller'
require './models/comment'
require './controllers/comment_controller'

# TODO development vs production
configure :development do
	DataMapper.setup(:default, 
		"sqlite3://#{Dir.pwd}/dbs/student.db")
end

configure :production do
	DataMapper.setup(:default, 
		ENV['DATAVASE_URL'])
end

Student.auto_migrate! unless DataMapper.repository(:default).adapter.storage_exists?('students')
Comment.auto_migrate! unless DataMapper.repository(:default).adapter.storage_exists?('comments')

# Session management
configure do
	enable :sessions
	set :username, "demo"
	set :password, "demo"
end

#---- Common Endpoints
get('/') do
	@title = "home page"
	erb :home
end

get('/about') do
	@title = "about page"
	erb :about
end

get('/contact') do
	@title = "contact page"
	erb :contact
end

get('/video') do
	@title = "video"
	erb :video
end

get('/login') do
	@title = "login"
	erb :login
end

post('/login') do
	@login_failed = true
	if settings.username.eql?(params[:username]) && settings.password.eql?(params[:password])
		session[:authorized] = "true"
		@login_faild = false
		redirect to "/"
	else
		erb :login
	end
end

get('/logout') do
	redirect to "/"
end

not_found do
	@title = "not found page"
	erb :notfound, :layout => false
end
