class CreateServices < ActiveRecord::Migration[5.0]
  def change
    create_table :services , id: false do |t|

      t.string :ser_description
      t.string :ser_note
      t.primary_key :pkservice
      t.timestamps
    end
  end
end
