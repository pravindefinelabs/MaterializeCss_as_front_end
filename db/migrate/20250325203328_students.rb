class Students < ActiveRecord::Migration[5.2]
  create_table :students do |t|
    t.string :name
    t.string :email
    t.timestamps
  end
end
