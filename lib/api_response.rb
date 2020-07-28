# frozen_string_literal: true

require_relative 'menu'

class APIResponse

  def show_most_used(response, total_population)
    response.each do |items|
      items[:res].each do |item|
        porcentage = calc_porcentage(item[:frequencia], total_population, 2)
        puts "#{item[:ranking]}° #{item[:nome]} - #{item[:frequencia]} - #{porcentage} %"
      end
    end
  end

  def show_frequence_names(response)
    puts 'Periodo - Frequência - Representavidade no Brasil'.yellow
    response.each do |items|
      puts "\nNome: #{items[:nome].capitalize}\n"
      items[:res].each do |item|
        decade = decade(item[:periodo])
        total_population_of_decade = menu.call_population(decade)
        porcentage = calc_porcentage(item[:frequencia], total_population_of_decade, 4)
        period =  format_period(item[:periodo])
        puts "#{period} #{item[:frequencia]} - #{porcentage} %"
      end
    end
  end

  private

  def menu
    Menu.new
  end

  def format_period(periodo)
    periodo.split('[').join.split(',').join(' até ').green
  end

  def decade(periodo)
    begin_decade = periodo.split('[').join.split(',')[0]
    end_to_decade = periodo.split('[').join.split(',')[1]
    return begin_decade unless end_to_decade

    end_to_decade
  end 

  def calc_porcentage(frequence, total_population, houses)
    (frequence.to_f/total_population.to_f).round(houses)
  end
end
