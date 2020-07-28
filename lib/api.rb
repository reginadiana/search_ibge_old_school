# frozen_string_literal: true

# Request to data of api
class API
  def requisition(url)
    response = Faraday.get(url)

    return {} unless response.status == 200

    JSON.parse(response.body, symbolize_names: true)
  end

  def call_most_used(state, total_population)
    puts 'Ranking - Nome - Frequência - Representavidade no Estado'.green
    puts 'Sexo Feminino'.green
    most_used(state, 'f', total_population)
    puts 'Sexo Masculino'.green
    most_used(state, 'm', total_population)
    puts 'Ambos os sexos'.green
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

  private

  def response_api
    APIResponse.new
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
end
