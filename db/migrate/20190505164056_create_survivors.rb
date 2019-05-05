class CreateSurvivors < ActiveRecord::Migration[5.2]
  def change
    create_table :survivors do |t|
      t.string :name
      t.string :age
      t.string :gender
      t.boolean :abducted, default: false

      t.timestamps
    end
  end
end
