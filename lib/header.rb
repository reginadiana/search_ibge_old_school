# frozen_string_literal: true

# Mesages to show in header
class Header
  def avalible_ufs
    decorate(37)
    puts 'Código | Sigla | População | Estado |'
    decorate(37)
  end

  def avalible_decades
    decorate(35)
    puts 'Década/Ano | Número de Habitantes |'.yellow
    decorate(35)
  end

  def most_used
    puts "\n"
    decorate(58)
    puts 'Ranking | Frequência | Representavidade no Estado | Nome |'.yellow
    decorate(58)
  end

  def frequence_names
    puts "\n"
    decorate(49)
    puts 'Periodo | Frequência | Representavidade no Brasil'.yellow
    decorate(49)
  end

  def most_used_by_decade(decade)
    decorate(45)
    puts "Ranking | Nome | Frequência | Decada (#{decade}) |".yellow
    decorate(45)
  end

  def option(state, population)
    puts "O estado escolhido foi #{state}. Você sabia que a população é de #{population} de habitantes?"
      .light_blue
  end

  def option_decade(decade, population)
    puts "A decada escolhida foi #{decade}. \nVocê sabia que naquela época a população era de #{population} de habitantes?"
      .light_blue
    puts 'Quem sabe a gente não encontra os nomes dos seus avós nessas listas?'
      .light_blue
  end

  private

  def decorate(amount)
    puts '-' * amount
  end
end
