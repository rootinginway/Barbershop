require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"			
end

get '/about' do
		erb :about
end

get '/visit' do
	erb :visit
end

post '/visit' do

	@username = params[:username]
	@phone = params[:phone]
	@datetime = params[:datetime]
	@barber = params[:barber]
	@color = params[:color]

	#хеш

	hh = {  :username => 'Enter your name', 
			:phone => 'Enter phonenumber',
			:datetime => 'Enter date and time' }

	#для пары ключ-значение

	hh.each do |key, value|

		#если параметр пуст
		if params[key] ==''
			#переменной ерор присвоить value из hh 
			#а value из hh - сообщение об ошибке
			#error - сообщение об ошибке
			@error = hh[key]

			return erb :visit
		end	
	end

	erb "OK! Username is #{@username}, #{@phone}, #{@datetime}, #{@barber}, #{@color}"

end

get '/contacts' do
	erb :contacts
end

post '/contacts' do
	@text = params[:text]
	@username = params[:username]
	@mail = params[:mail]


	erb "We'll answer your mail, #{@username}"
end
