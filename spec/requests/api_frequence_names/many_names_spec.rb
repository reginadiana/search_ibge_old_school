# frozen_string_literal: true

require 'spec_helper'

describe Api do
  api = Api.new
  url = 'https://servicodados.ibge.gov.br/api/v2/'

  context 'should get history of' do
    it 'a single name' do
      json = File.read('spec/fixtures/frequence_names/many_names.json')
      stub_request(:get, url).to_return(status: 200, body: json)
      result = api.requisition(url)

      expect(result.length).to eq 5

      expect(result[0][:nome]).to eq 'AMANDA'
      expect(result[0][:res][0][:periodo]).to include('1930')
      expect(result[0][:res][0][:frequencia]).to eq 363
      expect(result[0][:res][8][:periodo]).to include('2000,2010')
      expect(result[0][:res][8][:frequencia]).to eq 176_620

      expect(result[4][:nome]).to eq 'TEREZINHA'
      expect(result[4][:res][0][:periodo]).to include('1930')
      expect(result[4][:res][0][:frequencia]).to eq 6921
      expect(result[4][:res][8][:periodo]).to include('2000,2010')
      expect(result[4][:res][8][:frequencia]).to eq 768
    end
  end
end
