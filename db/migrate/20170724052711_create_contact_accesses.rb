class CreateContactAccesses < ActiveRecord::Migration[5.1]
  def change
    create_table :contact_accesses do |t|
      t.references :contact, foreign_key: true
      t.string :url
      t.datetime :visiting_date

      t.timestamps
    end
  end
end
