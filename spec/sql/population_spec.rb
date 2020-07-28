# frozen_string_literal: true

require 'spec_helper'
require 'sqlite3'

describe Sql do
  db = SQLite3::Database.open 'db/database.db'
  sql = Sql.new

  context('all informations of') do
    it 'table' do
      result = db.execute(sql.query_all_decades)

      expect(result.length).to eq 9
      expect(result[0]).to eq [1930,30635605]
      expect(result[1]).to eq [1940,41236315]
      expect(result[2]).to eq [1950,51944397]
      expect(result[3]).to eq [1960,70992343]
    end
    it 'population by decade' do
      decade = '50'
      like = '%' + decade
      population = sql.call_query(like, sql.query_some_population_by_decade, db)[0]

      expect(population).to eq 51944397
    end
    it 'population by year' do
      year = '1950'
      population = sql.call_query(year, sql.query_some_population_by_decade, db)[0]
      expect(population).to eq 51944397
    end
  end
end
