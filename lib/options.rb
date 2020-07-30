# frozen_string_literal: true

# Options
EXIT = 0
COMMON_NAMES_UF = 1
COMMON_NAMES_COUNTY = 2
FREQUENTY_NAMES = 3
MOST_USED_DECADE = 4
SHOW_UFS = 5
SHOW_DECADES = 6

# Show options to user
class Options
  def response_consult(option)
    to_common_names(option)
    to_frequence_names(option)
    to_show_info(option)
  end

  def to_common_names(option)
    if option == COMMON_NAMES_UF
      common_names(input.insert_uf, sql.query_info_federatives)
    elsif option == COMMON_NAMES_COUNTY
      common_names(input.insert_county, sql.query_info_counties)
    end
  end

  def to_frequence_names(option)
    if option == FREQUENTY_NAMES
      api.call_frequence_names(input.insert_names)
    elsif option == MOST_USED_DECADE
      most_used_decade
    end
  end

  def to_show_info(option)
    if option == SHOW_UFS
      menu.show_avalible_ufs
    elsif option == SHOW_DECADES
      menu.show_avalible_decades
    end
  end

  def most_used_decade
    decade = sql.call_query(input.insert_decade, sql.query_some_population_by_decade, db)

    return expect.search_not_found unless decade

    api.call_most_used_by_decade(decade[0])
  end

  def common_names(region, query)
    response = sql.call_query(region, query, db)
    return expect.search_not_found unless response

    api.call_most_used(response[1], response[3])
  end

  def call_population(decade)
    sql.call_query(decade, sql.query_some_population_by_decade, db)[1]
  end

  private

  def db
    SQLite3::Database.open 'db/database.db'
  end

  def sql
    Sql.new
  end

  def api
    Api.new
  end

  def input
    Input.new
  end

  def menu
    Menu.new
  end

  def expect
    ExceptionMessages.new
  end
end
