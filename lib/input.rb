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
    print "Digite um nome ou vários separados por vírgulas, exemplo:\n"
    print "Para um nome, digite: Diana\n".yellow
    print "Para vários nomes, digite: Diana, Joao, Camilo, Luiz\n".yellow
    print "Por favor, não use acentos =)\n".yellow

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
      input.gsub!(/\s+/, '')
    end
  end

  def clear
    system('clear')
    puts
  end

  def read_input
    gets.chomp
  end

  def sql
    Sql.new
  end
end
