# frozen_string_literal: true

require 'spec_helper'
require 'sqlite3'

describe Sql do
  db = SQLite3::Database.open 'db/database.db'
  sql = Sql.new

  context('makes a query in table County and returns') do
    it 'all informations of table' do
      result = db.execute(sql.query_all_counties)
      expect(result.length).to eq 5_570
    end
    it 'all information by name' do
      param = sql.aply_like_after('Diadema')
      column = sql.call_query(param, sql.query_info_counties, db)

      expect(column[0]).to eq 'MU'
      expect(column[1]).to eq 351_380_1
      expect(column[2]).to eq 'Diadema (SP)'
      expect(column[3]).to eq 423_884
    end
    it 'population by name' do
      param = sql.aply_like_after('Diadema')
      population = sql.call_query(param, sql.query_population_counties, db).join.to_i

      expect(population).to eq 423_884
    end
  end
end
