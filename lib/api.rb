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

  def show_most_used(response)
    response.each do |items|
      puts 'Ranking - Nome'.yellow
      items[:res].each do |item|
        puts "#{item[:ranking]}° #{item[:nome]}"
      end
    end
  end

  def most_used(uf, sex)
    url = url_most_used(uf, sex)
    response = requisition(url)
    show_most_used(response)
  end

  def call_most_used(uf)
    puts 'Sexo Feminino'.blue
    most_used(uf, 'f')
    puts 'Sexo Masculino'.blue
    most_used(uf, 'm')
    puts 'Ambos os sexos'.blue
    most_used(uf, 'both')
  end

  private
  
  def url_base
    "https://servicodados.ibge.gov.br/api/v2/"
  end

  def url_most_used(uf, sex)
    url_base+"censos/nomes/ranking?localidade=#{uf}&sexo=#{sex}"
  end
end
