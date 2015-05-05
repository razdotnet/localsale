class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.string :reply
   	  t.integer :question_id
      t.timestamps null: false
    end
  end
end
