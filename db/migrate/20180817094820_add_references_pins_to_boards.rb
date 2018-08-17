class AddReferencesPinsToBoards < ActiveRecord::Migration[5.2]
  def change
    add_reference :pins, :board, foreign_key: true
  end
end
