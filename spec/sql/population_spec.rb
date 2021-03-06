# frozen_string_literal: true

require 'spec_helper'
require 'sqlite3'

describe Sql do
  db = SQLite3::Database.open 'db/database.db'
  sql = Sql.new

  context('makes a query in table Population and returns') do
    it 'all table' do
      result = db.execute(sql.query_all_decades)

      expect(result.length).to eq 9
      expect(result[0]).to eq [1930, 30_635_605]
      expect(result[1]).to eq [1940, 41_236_315]
      expect(result[2]).to eq [1950, 51_944_397]
      expect(result[3]).to eq [1960, 70_992_343]
    end
    it 'population by decade' do
      population = sql.call_query(sql.aply_like_before('50'), sql.query_some_population_by_decade, db)[1]

      expect(population).to eq 51_944_397
    end
    it 'year by decade' do
      population = sql.call_query(sql.aply_like_before('50'), sql.query_some_population_by_decade, db)[0]

      expect(population).to eq 1950
    end
    it 'population by year' do
      population = sql.call_query('1950', sql.query_some_population_by_decade, db)[1]
      expect(population).to eq 51_944_397
    end
  end
end
