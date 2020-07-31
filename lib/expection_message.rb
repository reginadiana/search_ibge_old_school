# frozen_string_literal: true

# Show messages to exceptions
class ExceptionMessage
  def search_not_found
    puts 'Não foi possível encontrar os dados'.red
  end

  def check_invalidation_option(option)
    return unless option.negative? || option > 6

    puts "\nPor favor, digite uma opção válida\n".red
    true
  end

  def alert_bad_request
    abort('[400] Ops ... algo deu errado, tente escrever novamente.'.yellow)
  end
end
