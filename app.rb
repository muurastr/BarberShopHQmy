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
	#вызов метода (name = параметр, кот нужно проверить, 
		#далее метод принимает хеш (все, что после запятой - presence: true))
	validates :name, presence: true
	validates :phone, presence: true
	validates :datestamp, presence: true
	validates :color, presence: true
	#или
	#validates :name, presence => true
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
	if c.save
		erb "<h2>Спасибо за запись!</h2>"
	else
#у нашей модели "c" есть св-во errors, 
#у errors него есть класс=массив full_messages
#у кот есть метод first, кот возвращает 1 элемент массива
		@error = c.errors.full_messages.first
		erb :visit
	end

	
end