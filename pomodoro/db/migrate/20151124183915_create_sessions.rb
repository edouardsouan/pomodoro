class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.integer :completedSession
      t.integer :abortedSession
      t.date :date

      t.timestamps null: false
    end
  end
end
