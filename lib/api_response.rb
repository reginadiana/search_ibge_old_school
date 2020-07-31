# frozen_string_literal: true

# Show response of request api
class ApiResponse
  def show_most_used(response, total_population, sex)
    show_sex(sex)
    header.most_used
    response.each do |items|
      items[:res].each do |item|
        line_most_used(item, total_population)
      end
    end
  end

  def show_frequence_names(response)
    header.frequence_names
    response.each do |items|
      puts "\nNome: #{items[:nome].capitalize}".colorize(color: :black, background: :white)
      items[:res].each do |item|
        line_frequence_names(item)
      end
    end
  end

  def show_most_used_by_decade(response, decade, sex)
    show_sex(sex)
    header.most_used_by_decade(decade)
    response.each do |items|
      items[:res].each do |item|
        puts "#{item[:ranking]}° \t | #{item[:frequencia]} | #{item[:nome].capitalize}"
      end
    end
  end

  private

  def show_sex(sex)
    return message_female if sex == 'f'
    return message_male if sex == 'm'
    return message_both if sex == 'both'
  end

  def message_female
    puts "\n\t\t\t\tNomes femininos".colorize(color: :black, background: :white)
  end

  def message_male
    puts "\n\t\t\t\tNomes masculinos".colorize(color: :black, background: :white)
  end

  def message_both
    puts "\n\t\t\t\tAmbos os sexos".colorize(color: :black, background: :white)
  end

  def line_most_used(item, total_population)
    porcentage = calc_porcentage(item[:frequencia].to_f, total_population.to_f, 4)
    puts "#{item[:ranking]}° \t| #{item[:frequencia]} | #{porcentage} % | \t#{item[:nome].capitalize}"
  end

  def line_frequence_names(item)
    decade = decade(item[:periodo])
    total_population_of_decade = call_population(decade)
    porcentage = calc_porcentage(item[:frequencia].to_f, total_population_of_decade.to_f, 4)
    period = format_period(item[:periodo])
    puts "#{period} | #{item[:frequencia]} | #{porcentage} %"
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

  def call_population(decade)
    sql.call_query(decade, sql.query_some_population_by_decade, db)[1]
  end

  def menu
    Menu.new
  end

  def header
    Header.new
  end

  def options
    Option.new
  end

  def sql
    Sql.new
  end

  def db
    SQLite3::Database.open 'db/database.db'
  end
end
