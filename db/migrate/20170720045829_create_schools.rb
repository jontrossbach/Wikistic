class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :school_name
      t.string :school_address
      t.string :website
      t.string :phone_number
      t.string :age_range
      t.string :institutional_type
      t.string :denomination
      t.boolean :diploma
      t.integer :founded
      t.text :summary
      t.text :mission_statement
      t.string :admissions
      t.text :activities
      t.text :male_sports
      t.text :female_sports
      t.string :school_day_hours
      t.string :extended_hours
      t.string :financial_aid
      t.string :setting
      t.boolean :boarding
      t.integer :endowment
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
