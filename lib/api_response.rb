# frozen_string_literal: true

class APIResponse

  def show_most_used(response, total_population)
    response.each do |items|
      items[:res].each do |item|
        porcentage = calc_porcentage(item[:frequencia], total_population)
        puts "#{item[:ranking]}° #{item[:nome]} - #{item[:frequencia]} - #{porcentage} %"
      end
    end
  end

  def show_frequence_names(response)
    puts 'Periodo - Frequência - Representavidade no Brasil'.yellow
    response.each do |items|
      puts "\nNome: #{items[:nome].capitalize}\n"
      items[:res].each do |item|
        period =  format_period(item[:periodo])
        puts "#{period} #{item[:frequencia]}"
      end
    end
  end

  private

  def format_period(periodo)
    periodo.split('[').join.split(',').join(' até ').green
  end

  def calc_porcentage(frequence, total_population)
    (frequence.to_f/total_population.to_f).round(4)
  end
end
