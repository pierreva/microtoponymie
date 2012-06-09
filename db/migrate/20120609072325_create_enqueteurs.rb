class CreateEnqueteurs < ActiveRecord::Migration
  def change
    create_table :enqueteurs do |t|
      t.string :nom
      t.date :date_enquete
      t.string :informateur

      t.timestamps
    end
  end
end
