# frozen_string_literal: true

# Inputs to Menu
class Input
  def read_number
    gets.to_i
  end

  def insert_uf
    print 'Digite o código da UF:'
    read_input
  end

  def insert_county
    print "Digite o nome do municipio incluindo o estado:\n"
    print "Exemplo: Santo André (SP)\n".yellow
    read_input
  end

  def insert_names
    print "Digite um nome ou vários separados por vírgulas, exemplo:\n"
    print "Para um nome, digite: Diana\n".yellow
    print "Para vários nomes, digite: Diana, João, Camilo, Luiz\n".yellow

    separate_names(read_input)
  end

  def insert_decade
    print "\nDigite um ano (exemplo: '1950'):\n"
    read_input
  end

  private

  def separate_names(input)
    if input.include?(',')
      names = input.split(',').join('%7C')
      names.gsub!(/\s+/, '')
    else
      input
    end
  end

  def clear
    system('clear')
    puts
  end

  def read_input
    gets.chomp
  end
end
