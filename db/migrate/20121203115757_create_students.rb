class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :firstname
      t.string :lastname
      t.date :dateofbirth
      t.string :nationality
      t.string :email
      t.string :username

      t.timestamps
    end
  end
end
