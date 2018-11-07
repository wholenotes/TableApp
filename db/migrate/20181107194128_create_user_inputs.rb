class CreateUserInputs < ActiveRecord::Migration[5.2]
  def change
    create_table :user_inputs do |t|
      t.integer :num_of_columns
      t.text :csv

      t.timestamps
    end
  end
end
