class School < ActiveRecord::Base
  STATES = School.all.map(&:state).uniq.sort
  RELIGIONS = School.all.map(&:religious).delete_if{|r|r==nil}.uniq.sort

  def self.num_religions
    RELIGIONS.length
  end

  def self.random_religion
    RELIGIONS.sample
  end
end
