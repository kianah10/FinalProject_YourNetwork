class CreateConnections < ActiveRecord::Migration[6.0]
  def change
    create_table :connections do |t|
      t.integer :user_id
      t.string :comment
      t.string :photo
      t.integer :company_id
      t.integer :connection_of_connections_id
      t.string :current_company
      t.string :connection_name

      t.timestamps
    end
  end
end
