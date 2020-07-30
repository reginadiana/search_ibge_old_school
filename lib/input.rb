# frozen_string_literal: true

# Inputs to Menu
class Input
  def choice_option
    print 'Escolha uma opção: '
    read_number
  end

  def read_number
    gets.to_i
  end

  def insert_uf
    print "Digite o código, sigla ou nome (incluindo acentos, se houver) da UF:\n"
    sql.aply_like_after(read_input)
  end

  def insert_county
    print "Digite o nome do municipio incluindo o estado:\n"
    print "Exemplo: Santo André (SP)\n".yellow
    read_input
  end

  def insert_names
    puts "Digite um nome ou vários separados por vírgulas e não use acentos:\n"
    puts "\nAjuda:\n".yellow
    puts 'Para um nome, digite: Diana'
    puts "Para vários nomes, digite: Diana, Joao, Camilo, Luiz\n\n"

    separate_names(read_input)
  end

  def insert_decade
    print "\nDigite um ano ou década disponível na tabela (exemplo: '1950' ou '50'):\n"
    sql.aply_like_before(read_input)
  end

  private

  def separate_names(input)
    if input.include?(',')
      names = input.split(',').join('%7C')
      names.gsub!(/\s+/, '')
    else
      input.split[0]
    end
  end

  def clear
    system('clear')
    puts
  end

  def read_input
    print 'Digite: '
    gets.chomp
  end

  def sql
    Sql.new
  end
end
