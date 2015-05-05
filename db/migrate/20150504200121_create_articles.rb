class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :teacher
      t.text :place
      t.text :time
      t.integer :degree

      t.timestamps null: false
    end
  end
end
