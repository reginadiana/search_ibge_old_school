# frozen_string_literal: true

# Consultas no banco
class Sql
  def query_all_federatives
    read_file('query_all_federatives.sql')
  end

  def query_info_federatives
    read_file('query_info_federatives.sql')
  end

  def query_population_federatives
    read_file('query_population_federatives.sql')
  end

  def query_all_counties
    read_file('query_all_counties.sql')
  end

  def query_info_counties
    read_file('query_info_counties.sql')
  end

  def query_population_counties
    read_file('query_population_counties.sql')
  end

  def call_query(parm, query, db)
    query = db.prepare query
    response = query.execute parm
    response.next
  end

  private

  def read_file(file)
    File.open(Dir.pwd + "/queries/#{file}").read
  end
end
