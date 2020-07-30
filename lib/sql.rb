# frozen_string_literal: true

# Queries
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

  def query_all_decades
    read_file('query_all_decades.sql')
  end

  def query_some_population_by_decade
    read_file('query_some_population_by_decade.sql')
  end

  def call_query(parm, query, db)
    query = db.prepare query
    response = query.execute parm
    response.next
  end

  def aply_like_after(param)
    param + '%'
  end

  def aply_like_before(param)
    '%' + param
  end

  def aply_double_like(param)
    '%' + param + '%'
  end

  private

  def read_file(file)
    File.open(Dir.pwd + "/queries/#{file}").read
  end
end
