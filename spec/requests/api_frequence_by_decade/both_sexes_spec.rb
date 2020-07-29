# frozen_string_literal: true

require 'spec_helper'

describe Api do
  api = Api.new
  url = 'https://servicodados.ibge.gov.br/api/v2/'

  it 'should get names most used in 1950 to both sexes' do
    json = File.read('spec/fixtures/ranking_by_decade/both_sexes.json')
    response = JSON.parse(json, symbolize_names: true)
    stub_request(:get, url).to_return(status: 200, body: json)
    result = api.requisition(url)

    expect(result.length).to eq 1

    (0..19).each do |index|
      expect(result[0][:res][index][:nome]).to eq response[0][:res][index][:nome]
      expect(result[0][:res][index][:frequencia]).to eq response[0][:res][index][:frequencia]
      expect(result[0][:res][index][:ranking]).to eq response[0][:res][index][:ranking]
    end
  end
  it 'should return return empty array if API error beacuse decade is invalid' do
    stub_request(:get, url).to_return(status: 500, body: '{}')
    result = api.requisition(url)

    expect(result.length).to eq 0
  end
end
