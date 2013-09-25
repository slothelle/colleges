module Stats
  def self.most_expensive(schools)
    schools.delete_if { |s| s.fees12 == nil }.sort_by(&:fees12).last
  end

  def self.least_expensive(schools)
    schools.delete_if { |s| s.fees12 == nil || s.fees12 == 0 }.sort_by(&:fees12).first
  end

  def self.number_with_delimiter(number, delimiter=",", separator=".")
    begin
      parts = number.to_s.split('.')
      parts[0].gsub!(/(\d)(?=(\d\d\d)+(?!\d))/, "\\1#{delimiter}")
      parts.join separator
    rescue
     number
    end
  end
end