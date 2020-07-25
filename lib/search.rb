# frozen_string_literal: true

require 'io/console'
require 'colorize'
require_relative 'menu'

menu = Menu.new
menu.welcome
option = menu.show

while option != EXIT
  menu.clear
  if not menu.check_invalidation_option(option)
    menu.response_consult(option)
  end
  option = menu.show
end

if option == EXIT
  puts "\nObrigada por acessar a nossa plataforma de pesquisa :)\n".green
end
