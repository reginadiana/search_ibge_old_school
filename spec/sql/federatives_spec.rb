# frozen_string_literal: true

require 'spec_helper'
require 'sqlite3'

describe Sql do
  db = SQLite3::Database.open 'db/database.db'
  sql = Sql.new

  context('Search by table federatives and get') do
    it 'all UF data' do
      result = db.execute(sql.query_all_federatives)
      expect(result.length).to eq 27
    end
    it 'all informations of same UF by name' do
      param = 'São Paulo'
      column = sql.call_query(param, sql.query_info_federatives, db)

      expect(column[0]).to eq 'UF'
      expect(column[1]).to eq 35
      expect(column[2]).to eq 'São Paulo'
      expect(column[3]).to eq 45_919_049
    end
    it 'all informations of same UF by code' do
      param = 35
      column = sql.call_query(param, sql.query_info_federatives, db)

      expect(column[0]).to eq 'UF'
      expect(column[1]).to eq 35
      expect(column[2]).to eq 'São Paulo'
      expect(column[3]).to eq 45_919_049
    end
  end
end
