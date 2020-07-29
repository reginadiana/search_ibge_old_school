# frozen_string_literal: true

require 'spec_helper'

describe Api do
  api = Api.new
  url = 'https://exemplo.com.br'

  it 'should get ranking of 20 names most used in SP to both sexes' do
    json = File.read('spec/fixtures/ranking_names_by_uf/both_sexes.json')
    response = JSON.parse(json, symbolize_names: true)
    stub_request(:get, url).to_return(status: 200, body: json)
    result = api.requisition(url)

    expect(result[0][:res].length).to eq 20

    (0..19).each do |index|
      expect(result[0][:res][index][:nome]).to eq response[0][:res][index][:nome]
      expect(result[0][:res][index][:frequencia]).to eq response[0][:res][index][:frequencia]
      expect(result[0][:res][index][:ranking]).to eq response[0][:res][index][:ranking]
    end
  end

  it 'should return return empty array if API error' do
    stub_request(:get, url).to_return(status: 200, body: '{}')
    result = api.requisition(url)

    expect(result.length).to eq 0
  end
end
