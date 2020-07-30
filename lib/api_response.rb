# frozen_string_literal: true

# Show response of request api
class ApiResponse
  def show_most_used(response, total_population)
    header_most_used
    response.each do |items|
      items[:res].each do |item|
        line_most_used(item, total_population)
      end
    end
  end

  def show_frequence_names(response)
    header_frequence_names
    response.each do |items|
      puts "Nome: #{items[:nome].capitalize}"
      items[:res].each do |item|
        line_frequence_names(item)
      end
      menu.decorate(39)
    end
  end

  def show_most_used_by_decade(response, decade)
    menu.decorate(45)
    puts "Ranking | Nome | Frequência | Decada (#{decade}) |".yellow
    menu.decorate(45)
    response.each do |items|
      items[:res].each do |item|
        puts "#{item[:ranking]}° \t | #{item[:frequencia]} | #{item[:nome].capitalize}"
      end
    end
  end

  private

  def line_most_used(item, total_population)
    porcentage = calc_porcentage(item[:frequencia].to_f, total_population.to_f, 4)
    puts "#{item[:ranking]}° \t| #{item[:frequencia]} | #{porcentage} % | \t#{item[:nome].capitalize}"
  end

  def line_frequence_names(item)
    decade = decade(item[:periodo])
    total_population_of_decade = options.call_population(decade)
    porcentage = calc_porcentage(item[:frequencia].to_f, total_population_of_decade.to_f, 4)
    period = format_period(item[:periodo])
    puts "#{period} | #{item[:frequencia]} | #{porcentage} %"
  end

  def header_most_used
    menu.decorate(58)
    puts 'Ranking | Frequência | Representavidade no Estado | Nome |'.yellow
    menu.decorate(58)
  end

  def header_frequence_names
    menu.decorate(49)
    puts 'Periodo | Frequência | Representavidade no Brasil'.yellow
    menu.decorate(49)
  end

  def menu
    Menu.new
  end

  def options
    Options.new
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
    (frequence / total_population).round(houses)
  end
end
