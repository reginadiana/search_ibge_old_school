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
    response_decade = sql.call_query(input.insert_decade, sql.query_some_population_by_decade, DB)

    return expect.search_not_found unless response_decade

    menu.header_option_decade(response_decade[0], response_decade[1])
    api.call_most_used_by_decade(response_decade[0])
  end

  def common_names(region, query)
    response = sql.call_query(region, query, DB)
    return expect.search_not_found unless response

    menu.header_option(response[2], response[3])
    api.call_most_used(response[1], response[3])
  end

  def call_population(decade)
    sql.call_query(decade, sql.query_some_population_by_decade, DB)[1]
  end

  private

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
