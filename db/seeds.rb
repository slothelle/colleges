require 'csv'

CSV.foreach('condensed.csv', :headers => true, :header_converters => :symbol, :converters => :all) do |row|
  school = Hash[row]
  result = School.create!(school)
  puts result
end