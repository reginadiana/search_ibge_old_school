# frozen_string_literal: true

require 'spec_helper'
require 'sqlite3'

describe Sql do
  db = SQLite3::Database.open 'db/database.db'
  sql = Sql.new

  context('Search by table federatives and get') do
    it 'population of same UF by name' do
      param = 'São Paulo'
      population = sql.call_query(param, sql.query_population_federatives, db).join.to_i
      expect(population).to eq 45_919_049
    end
    it 'population of same UF by code' do
      param = 35
      population = sql.call_query(param, sql.query_population_federatives, db).join.to_i
      expect(population).to eq 45_919_049
    end
  end
end
