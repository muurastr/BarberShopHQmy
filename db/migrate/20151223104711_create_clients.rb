class CreateClients < ActiveRecord::Migration
  def change
  	#метод create_table принимает параметр в виде символа с именем табицы (здесь client)
  	create_table :client do |t|
  		#в таблице client буду созданы столбцы name, phone... типа text
  		#id будет создан автоматически
  		t.text :name
  		t.text :phone
  		t.text :datestamp
  		t.text :barber
  		t.text :color
#метод - будут созданы 2 доп столбца: created_at & updarted_at
  		t.timestamps 
  	end
  end
end
