class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.integer :unitid
      t.integer :headcount_all
      t.integer :headcount_undergrad
      t.integer :fees09
      t.integer :fees10
      t.integer :fees11
      t.integer :fees12
      t.string  :name
      t.string  :street
      t.string  :city
      t.string  :state
      t.string  :zip
      t.string  :website
      t.string  :affiliation
      t.string  :control
      t.string  :religious
      t.string  :bachelors
      t.string  :masters
      t.string  :require_gpa
      t.string  :require_rank
      t.string  :require_record
      t.string  :require_collegeprep
      t.string  :require_recs
      t.string  :require_tests
      t.string  :calendar
      t.string  :percentdisabilities
    end
  end
end
