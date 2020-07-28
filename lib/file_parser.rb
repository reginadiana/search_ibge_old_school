# frozen_string_literal: true

# File manipulation
class FileParser
  def open_files
    return unless check_file_exit('new_federatives') && check_file_exit('new_counties')

    federative_csv = create_file('new_federatives')
    counties_csv = create_file('new_counties')
    new_ferefative_file(federative_csv, counties_csv)
  end

  def new_ferefative_file(federative_csv, counties_csv)
    federatives = read_each_line('federatives')

    federatives.each do |columns|
      columns_federatives = columns.split(',')
      federative_csv.puts "#{columns[0, columns.length - 1]}," + new_county_file(counties_csv, columns_federatives).to_s
    end
  end

  def new_county_file(counties_csv, columns_federatives)
    counties = read_each_line('counties')
    total_population_uf = 0
    counties.each do |columns|
      counties_columns = columns.split(',')
      if columns_federatives[1] == code_uf(counties_columns)
        total_population_uf += counties_columns[3].to_i
        counties_csv.puts "#{columns[0, columns.length - 2]}," + uf_of_county(counties_columns).to_s
      end
    end
    total_population_uf
  end

  def uf_of_county(counties_columns)
    counties_columns[2].split(' (')[1].split(')')[0]
  end

  def code_uf(counties_columns)
    counties_columns[1].to_s[0, 2]
  end

  def open_federative_file
    read_each_line('new_federatives')
  end

  def open_county_file
    read_each_line('new_counties')
  end

  def total_population_brazil
    counties = read_each_line('new_federatives')

    total_population = 0
    counties.each do |columns|
      population_of_county = columns.split(',')[3].to_i
      total_population += population_of_county
    end
    total_population
  end

  def check_file_exit(file)
    File.exist?(Dir.pwd + "/data/#{file}.csv")
  end

  private

  def read_file(file)
    File.open(Dir.pwd + "/data/#{file}.csv").read
  end

  def read_each_line(file)
    File.readlines(Dir.pwd + "/data/#{file}.csv")
  end

  def create_file(file)
    File.new("data/#{file}.csv", 'w')
  end
end
