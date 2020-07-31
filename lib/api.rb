# frozen_string_literal: true

# Request to data of api
class Api
  def requisition(url)
    response = Faraday.get(url)

    return {} unless response.status == 200

    JSON.parse(response.body, symbolize_names: true)
  end

  def call_frequence_names(names)
    url = call_url.frequence(names)
    response = requisition(url)
    response_api.show_frequence_names(response)
  end

  def call_most_used(state, sex, total_population)
    url = call_url.most_used(state, sex)
    response = requisition(url)
    response_api.show_most_used(response, total_population, sex)
  end

  def call_most_used_by_decade(decade, sex)
    url = call_url.most_used_by_decade(decade, sex)
    response = requisition(url)

    return expect.search_not_found if response == []

    response_api.show_most_used_by_decade(response, decade, sex)
  end

  private

  def response_api
    ApiResponse.new
  end

  def expect
    ExceptionMessage.new
  end

  def call_url
    Url.new
  end
end
