class CreateConnectionsOfConnections < ActiveRecord::Migration[6.0]
  def change
    create_table :connections_of_connections do |t|
      t.integer :connection_id
      t.string :name
      t.string :company

      t.timestamps
    end
  end
end
