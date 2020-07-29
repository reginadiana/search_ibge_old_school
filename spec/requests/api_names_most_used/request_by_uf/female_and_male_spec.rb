# frozen_string_literal: true

require 'spec_helper'

describe Api do
  api = Api.new
  url = 'https://servicodados.ibge.gov.br/api/v2/'

  it 'should get ranking of 20 names most used in SP to female sex' do
    json = File.read('spec/fixtures/ranking_names_by_uf/female.json')
    response = JSON.parse(json, symbolize_names: true)
    stub_request(:get, url).to_return(status: 200, body: json)
    result = api.requisition(url)

    (0..19).each do |index|
      expect(result[0][:res][index][:nome]).to eq response[0][:res][index][:nome]
      expect(result[0][:res][index][:frequencia]).to eq response[0][:res][index][:frequencia]
      expect(result[0][:res][index][:ranking]).to eq response[0][:res][index][:ranking]
    end
  end

  it 'should get ranking of 20 names most used in SP to male sex' do
    json = File.read('spec/fixtures/ranking_names_by_uf/male.json')
    response = JSON.parse(json, symbolize_names: true)
    stub_request(:get, url).to_return(status: 200, body: json)
    result = api.requisition(url)

    (0..19).each do |index|
      expect(result[0][:res][index][:nome]).to eq response[0][:res][index][:nome]
      expect(result[0][:res][index][:frequencia]).to eq response[0][:res][index][:frequencia]
      expect(result[0][:res][index][:ranking]).to eq response[0][:res][index][:ranking]
    end
  end
end
