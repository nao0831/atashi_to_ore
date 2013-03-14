class CreateAchieves < ActiveRecord::Migration
  def change
    create_table :achieves do |t|
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
