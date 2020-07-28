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

  def show_most_used(response, total_population)
    
    response.each do |items|
      puts 'Ranking - Nome - Frequencia - Representavidade no Estado'.yellow
      items[:res].each do |item|
        porcentage = calc_porcentage(item[:frequencia], total_population)
        puts "#{item[:ranking]}° #{item[:nome]} - #{item[:frequencia]} - #{porcentage} %"
      end
    end
  end

  def calc_porcentage(frequence, total_population)
    (frequence.to_f/total_population.to_f).round(4)
  end

  def most_used(uf, sex, total_population)
    url = url_most_used(uf, sex)
    response = requisition(url)
    show_most_used(response, total_population)
  end

  def call_most_used(uf, total_population)
    puts 'Sexo Feminino'.blue
    most_used(uf, 'f', total_population)
    puts 'Sexo Masculino'.blue
    most_used(uf, 'm', total_population)
    puts 'Ambos os sexos'.blue
    most_used(uf, 'both', total_population)
  end

  private
  
  def url_base
    "https://servicodados.ibge.gov.br/api/v2/"
  end

  def url_most_used(uf, sex)
    url_base+"censos/nomes/ranking?localidade=#{uf}&sexo=#{sex}"
  end
end
