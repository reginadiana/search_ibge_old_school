# frozen_string_literal: true

require 'io/console'
require 'colorize'
require_relative 'menu'

menu = Menu.new
menu.welcome
option = menu.show

while option != EXIT
  menu.clear
  menu.response_consult(option) unless menu.check_invalidation_option(option)
  option = menu.show
end

puts "\nObrigada por acessar a nossa plataforma de pesquisa :)\n".green if option == EXIT
