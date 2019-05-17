# frozen_string_literal: true

class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.string :city, null: false
      t.string :country, null: false
      t.date :start_date, null: false
      t.date :end_date, null: false

      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
