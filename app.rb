#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
#подключение к БД
set :database, "sqlite3:barbershop.db"
#создать класс, кот будет представлять сущность
#что-то, что описывает (клиент, barber...)

class Barber < ActiveRecord::Base
end

class Client < ActiveRecord::Base
end

before do
	#инициализация переменной barbers
	#выбор всех! записей из таблицы
	@barbers = Barber.all
	#или сортировка
	#@barbers = Barber.order "created_at DESC"
end
	
get '/' do
	erb :index
end

get '/visit' do
	erb :visit
end

get '/contacts' do
	erb :contact
end

post '/visit' do

	c = Client.new params[:client]
	c.save

	erb "<h2>Спасибо за запись!</h2>"
end