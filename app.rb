# third-party dependency
require 'sinatra'
require 'sinatra/reloader'
require 'dm-core'
require 'dm-migrations'
# files in project
require './controllers/students_controller'
require './models/student'

# TODO development vs production
DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/dbs/student.db")

Student.auto_migrate!


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

not_found do
	@title = "not found page"
	erb :notfound, :layout => false
end
