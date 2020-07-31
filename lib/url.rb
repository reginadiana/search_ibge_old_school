# frozen_string_literal: true

# Urls to request
class Url

  def most_used(state, sex)
    base + "ranking?localidade=#{state}&sexo=#{sex}"
  end

  def frequence(names)
    base + names.to_s
  end

  def most_used_by_decade(decade, sex)
    base + "ranking/?decada=#{decade}&sexo=#{sex}"
  end

  private

  def base
    'https://servicodados.ibge.gov.br/api/v2/censos/nomes/'
  end
end
