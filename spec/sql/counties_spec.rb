# frozen_string_literal: true

require 'spec_helper'
require 'sqlite3'

describe Sql do
  db = SQLite3::Database.open 'db/database.db'
  sql = Sql.new

  context('all informations of') do
    it 'table' do
      result = db.execute(sql.query_all_counties)
      expect(result.length).to eq 5_570
    end
    it 'counties by name' do
      title = 'Diadema'
      like = title + '%'
      column = sql.call_query(like, sql.query_info_counties, db)

      expect(column[0]).to eq 'MU'
      expect(column[1]).to eq 351_380_1
      expect(column[2]).to eq 'Diadema (SP)'
      expect(column[3]).to eq 423_884
      expect(column[4]).to eq "SP\n"
    end
    it 'population of UF him by your name' do
      title = 'Diadema'
      like = title + '%'
      population = sql.call_query(like, sql.query_population_counties, db).join.to_i

      expect(population).to eq 423_884
    end
  end
end
