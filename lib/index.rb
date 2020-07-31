# frozen_string_literal: true

require_relative 'require_files'

options = Option.new
menu = Menu.new
expect = ExceptionMessage.new

menu.welcome
option = menu.show

while option != EXIT
  options.response_consult(option) unless expect.check_invalidation_option(option)
  option = menu.show
end

puts "\nObrigada por acessar a nossa plataforma de pesquisa :)\n".green if option == EXIT
