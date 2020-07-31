# frozen_string_literal: true

# Request to data of api
class Api
  def requisition(url)
    response = Faraday.get(url)

    return {} unless response.status == 200

    JSON.parse(response.body, symbolize_names: true)
  end

  def call_frequence_names(names)
    url = url_frequence(names)
    response = requisition(url)
    response_api.show_frequence_names(response)
  end

  def call_most_used(state, sex, total_population)
    url = url_most_used(state, sex)
    response = requisition(url)
    response_api.show_most_used(response, total_population, sex)
  end

  def call_most_used_by_decade(decade, sex)
    url = url_most_used_by_decade(decade, sex)
    response = requisition(url)

    return expect.search_not_found if response == []

    response_api.show_most_used_by_decade(response, decade, sex)
  end

  private

  def response_api
    ApiResponse.new
  end

  def expect
    ExceptionMessage.new
  end

  def url_base
    'https://servicodados.ibge.gov.br/api/v2/censos/nomes/'
  end

  def url_most_used(state, sex)
    url_base + "ranking?localidade=#{state}&sexo=#{sex}"
  end

  def url_frequence(names)
    url_base + "#{names}"
  end

  def url_most_used_by_decade(decade, sex)
    url_base + "ranking/?decada=#{decade}&sexo=#{sex}"
  end
end
