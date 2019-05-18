# frozen_string_literal: true

class CreateWeather < ActiveRecord::Migration[5.2]
  def change
    create_table :weathers do |t|
      t.string :location
      t.float :latitude
      t.float :longitude
      t.date :date

      t.timestamps
    end
  end
end
