# frozen_string_literal: true

require 'spec_helper'
require 'sqlite3'

describe Sql do
  db = SQLite3::Database.open 'db/database.db'
  sql = Sql.new

  context('makes a query in table Federatives and returns all') do
    it 'table' do
      result = db.execute(sql.query_all_federatives)
      expect(result.length).to eq 27
    end
    it 'informations by name' do
      param = 'São Paulo'
      column = sql.call_query(param, sql.query_info_federatives, db)

      expect(column[0]).to eq 'UF'
      expect(column[1]).to eq 35
      expect(column[2]).to eq 'São Paulo'
      expect(column[3]).to eq 45_919_049
      expect(column[4]).to eq "SP\n"
    end
    it 'informations by code' do
      param = 35
      column = sql.call_query(param, sql.query_info_federatives, db)

      expect(column[0]).to eq 'UF'
      expect(column[1]).to eq 35
      expect(column[2]).to eq 'São Paulo'
      expect(column[3]).to eq 45_919_049
      expect(column[4]).to eq "SP\n"
    end
  end
end
