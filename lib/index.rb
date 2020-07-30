# frozen_string_literal: true

require 'io/console'
require 'colorize'
require 'sqlite3'
require 'faraday'
require 'json'

require_relative 'api_response'
require_relative 'options'
require_relative 'menu'
require_relative 'sql'
require_relative 'api'
require_relative 'input'
require_relative 'expection_message'

options = Options.new
menu = Menu.new
expect = ExceptionMessages.new

menu.welcome
option = menu.show

while option != EXIT
  options.response_consult(option) unless expect.check_invalidation_option(option)
  option = menu.show
end

puts "\nObrigada por acessar a nossa plataforma de pesquisa :)\n".green if option == EXIT
