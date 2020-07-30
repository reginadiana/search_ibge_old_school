# frozen_string_literal: true

require 'spec_helper'
require 'sqlite3'

describe Sql do
  db = SQLite3::Database.open 'db/database.db'
  sql = Sql.new

  context('return error when') do
    it 'seach by invalid name' do
      param = 'invalidname'
      response_query = sql.call_query(param, sql.query_population_counties, db)
      expect(response_query).to eq nil
    end
    it 'seach by invalid name' do
      param = 'invalidname'
      response_query = sql.call_query(param, sql.query_info_counties, db)
      expect(response_query).to eq nil
    end
  end
end
