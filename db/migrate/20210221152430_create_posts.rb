class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    #Создаем таблицу для хранения записей
    create_table :posts do |t|
      t.string :name, default: ''
      t.string :title, default: ''
      t.string :content, default: ''
      t.timestamps
    end
  end
end
