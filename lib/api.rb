# frozen_string_literal: true

require 'faraday'
require 'json'
require 'colorize'

class API
  def requisition(url)
    response = Faraday.get(url)

    return {} unless response.status == 200

    JSON.parse(response.body, symbolize_names: true)
  end

  def most_used_female(uf)
    url = url_base+"censos/nomes/ranking?localidade=#{uf}&sexo=f"
    response = requisition(url)

    response.each do |items|
      puts 'Ranking - Nome'.yellow
      items[:res].each do |item|
        puts "#{item[:ranking]}° #{item[:nome]}"
      end
    end 
  end

  private
  
  def url_base
    "https://servicodados.ibge.gov.br/api/v2/"
  end
end
