require 'sinatra'
require 'sinatra/reloader'

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
