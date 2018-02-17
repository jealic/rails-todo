class CreateTodos < ActiveRecord::Migration[5.1]
  def change
    create_table :todos do |t|
      t.string :title
      t.date :date
      t.text :description

      t.timestamps
    end
  end
end
