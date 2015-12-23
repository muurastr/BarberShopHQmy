#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
#подключение к БД
set :database, "sqlite3:barbershop.db"
#создать класс, кот будет представлять сущность
#что-то, что описывает (клиент, barber...)
class Client < ActiveRecord::Base
end

class Barber < ActiveRecord::Base
end

get '/' do
	#инициализация переменной barbers
	#выбор всех! записей из таблицы
	#@barbers = Barber.all
	#или сортировка
	@barbers = Barber.order "created_at DESC"
	erb :index
end