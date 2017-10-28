class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :category
      t.string :title
      t.text :desc
      t.string :source
      t.string :author

      t.timestamps
    end
  end
end
