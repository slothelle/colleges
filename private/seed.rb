require 'csv'

def seed
  data = {}

  CSV.foreach("data/institutions-cleansed.csv", :headers => true, :header_converters => :symbol, :converters => :all) do |row|
    data["#{row[:unitid]}"] = Hash[row]
    print '.'
  end

  puts "\n file 1 done \n"

  CSV.foreach("data/tuition-cleansed.csv", :headers => true, :header_converters => :symbol, :converters => :all) do |row|
    row_hash = data["#{row[:unitid]}"]
    row = Hash[row]
    data["#{row[:unitid]}"] = row.merge(row_hash)
    print '.'
  end

  puts "\n file 2 done \n"

  CSV.foreach("data/headcount-cleansed.csv", :headers => true, :header_converters => :symbol, :converters => :all) do |row|
    row_hash = data["#{row[:unitid]}"]
    row = Hash[row]
    data["#{row[:unitid]}"] = row.merge(row_hash)
    print '.'
  end

  puts "\n file 3 done \n"

  key = data.keys.first
  headers = data[key].keys

  CSV.open('data/condensed.csv', 'wb', :headers => true, :header_converters => :symbol, :converters => :all) do |csv|
    csv << headers
    data.each do |key, value|
      csv << value.values
    end
  end
end

seed
