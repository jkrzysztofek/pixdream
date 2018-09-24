# frozen_string_literal: true

class CreatePins < ActiveRecord::Migration[5.1]
  def change
    create_table :pins do |t|
      t.string :description

      t.timestamps
    end
  end
end
