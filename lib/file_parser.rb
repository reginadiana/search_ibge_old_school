# frozen_string_literal: true

require 'sql'

# Classe para arquivo csv
class FileParser

  def files_not_exist(first_file, second_file)
    first_file_exist = File.exist?(Dir.pwd + "/data/#{first_file}.csv")
    second_file_exist = File.exist?(Dir.pwd + "/data/#{second_file}.csv")

    return (first_file_exist and second_file_exist)
  end 

  def separate_csv
    if files_not_exist('federatives', 'counties')

      federative_csv = create_file('federatives')
      counties_csv = create_file('counties')

      population = read_each_line('populacao_2019')
      population.each do |line|
        columns = line.split(',')
        columns.each do |item|
    
        if item.include?('UF')
          federative_csv.puts line[0, line.length-3]
        end
        
        if item.include?('MU')
          counties_csv.puts line
        end
      end
    end
      counties_csv.close
      federative_csv.close
    end
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
