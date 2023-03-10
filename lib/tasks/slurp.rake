namespace :slurp do
  desc "TODO"
  task connection: :environment do
    require "csv"
    csv_text = File.read(Rails.root.join("lib", "csvs", "connection.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
    csv.each do |row|
      puts row.to_hash
      c = Connection.new
      c.id = row ["id"]
      c.user = row["user"]
      c.comment = row["comment"]
      c.photo = row["photo"]
      c.company = row ["company"]
      c.connections_of_connections = row["connections of connections"]
      c.current_company = row["current company"]
      c.connection_name = row["connection name"]
      c.created_at = row ["created at"]
      c.updated_at =row ["updated at"]
      c.save
      puts "#{t.user}, #{t.comment} saved"
      end
      puts "There are now #{Connection.count} rows in the transactions table"
  end

end
