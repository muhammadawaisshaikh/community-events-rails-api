class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :contact
      t.string :imgUrl
      t.string :email
      t.string :bioData
      t.json :socials

      t.timestamps
    end
  end
end
