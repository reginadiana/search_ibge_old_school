# frozen_string_literal: true

require 'spec_helper'
require 'sqlite3'

describe Sql do
  db = SQLite3::Database.open 'db/database.db'
  sql = Sql.new

  context('return error when makes a query in table Population with') do
    it 'year out of range' do
      param = '1900'
      response_query = sql.call_query(param, sql.query_some_population_by_decade, db)
      expect(response_query).to eq nil
    end
    it 'decade out of range' do
      param = '43'
      response_query = sql.call_query(param, sql.query_some_population_by_decade, db)
      expect(response_query).to eq nil
    end
  end
end
