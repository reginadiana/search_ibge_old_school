# frozen_string_literal: true

require 'io/console'
require 'sqlite3'
require 'colorize'
require_relative 'sql'

db = SQLite3::Database.open 'db/database.db'

def menu

  print "\nUnidades Federativas (UF):\n"
  read_data('federatives')

  print "\nMenu:\n".yellow

  puts "[#{SAIR}] Sair".yellow

  print 'Escolha uma opção: '
  gets.to_i
end

def decorate
  puts '-' * 60
end

def welcome
  puts 'Bem-vindo a plataforma de pesquisa do IBGE!'.green
end

def clear
  system('clear')
  puts
end

def read_input
  gets.chomp
end

def insert_uf
  print 'Digite o código da UF:'
  read_input
end

def insert_county
  print 'Digite o código do Municipio:'
  read_input
end

def continue
  puts "\nEscolha uma opção:"
  gets.to_i
end

def search_not_found
  puts 'Não foi possível encontrar os dados, tente novamente'.red
end

clear
welcome
opcao = menu


if opcao == SAIR
  puts "\nObrigada por acessar a nossa plataforma de pesquisa :)\n".green
end
