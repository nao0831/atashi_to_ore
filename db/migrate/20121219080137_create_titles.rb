class CreateTitles < ActiveRecord::Migration
  def change
    create_table :titles do |t|
    	t.string :name
    	t.string :sales_date
    	
      t.timestamps
    end
  end
end
