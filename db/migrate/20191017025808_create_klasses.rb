class CreateKlasses < ActiveRecord::Migration[6.0]
  def change
    create_table :klasses do |t|
      t.string :type
      t.string :info
      t.string :instructor
      t.string :day
      t.time :time
      t.integer :length
      

      t.timestamps
    end
  end
end
