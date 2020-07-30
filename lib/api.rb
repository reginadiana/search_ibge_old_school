# frozen_string_literal: true

# Request to data of api
class Api
  def requisition(url)
    response = Faraday.get(url)

    return {} unless response.status == 200

    JSON.parse(response.body, symbolize_names: true)
  end

  def call_most_used(state, total_population)
    puts "\n\t\t\t\tNomes femininos".colorize(color: :black, background: :white)
    most_used(state, 'f', total_population)
    puts "\n\t\t\t\tNomes masculinos".colorize(color: :black, background: :white)
    most_used(state, 'm', total_population)
    puts "\n\t\t\t\tAmbos os sexos".colorize(color: :black, background: :white)
    most_used(state, 'both', total_population)
  end

  def call_frequence_names(names)
    url = url_frequence(names)
    response = requisition(url)
    response_api.show_frequence_names(response)
  end

  def most_used(state, sex, total_population)
    url = url_most_used(state, sex)
    response = requisition(url)
    response_api.show_most_used(response, total_population)
  end

  def call_most_used_by_decade(decade)
    puts "\n\t\t\t\tNomes femininos".colorize(color: :black, background: :white)
    most_used_by_decade(decade, 'f')
    puts "\n\t\t\t\tNomes masculinos".colorize(color: :black, background: :white)
    most_used_by_decade(decade, 'm')
    puts "\n\t\t\t\tAmbos os sexos".colorize(color: :black, background: :white)
    most_used_by_decade(decade, 'both')
  end

  def most_used_by_decade(decade, sex)
    url = url_most_used_by_decade(decade, sex)
    response = requisition(url)

    return expect.search_not_found if response == []

    response_api.show_most_used_by_decade(response, decade)
  end

  private

  def response_api
    ApiResponse.new
  end

  def menu
    Menu.new
  end

  def expect
    ExceptionMessages.new
  end

  def url_base
    'https://servicodados.ibge.gov.br/api/v2/'
  end

  def url_most_used(state, sex)
    url_base + "censos/nomes/ranking?localidade=#{state}&sexo=#{sex}"
  end

  def url_frequence(names)
    url_base + "censos/nomes/#{names}"
  end

  def url_most_used_by_decade(decade, sex)
    url_base + "censos/nomes/ranking/?decada=#{decade}&sexo=#{sex}"
  end
end
