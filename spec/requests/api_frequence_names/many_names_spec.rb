# frozen_string_literal: true

require 'spec_helper'

describe Api do
  api = Api.new
  input = Input.new

  context 'should get history of' do
    it 'a single name' do
      json = File.read('spec/fixtures/frequence_names/many_names.json')
      names = input.separate_names('amanda, diana, joao, leticia, terezinha')
      url = api.url_frequence(names)
      response = double('faraday_response', body: json, status: 200)
      allow(Faraday).to receive(:get).with(url).and_return(response)
      result = api.requisition(url)

      expect(result.length).to eq 5

      expect(result[0][:nome]).to eq 'AMANDA'
      expect(result[0][:res][0][:periodo]).to include('1930')
      expect(result[0][:res][0][:frequencia]).to eq 363
      expect(result[0][:res][8][:periodo]).to include('2000,2010')
      expect(result[0][:res][8][:frequencia]).to eq 176620

      expect(result[4][:nome]).to eq 'TEREZINHA'
      expect(result[4][:res][0][:periodo]).to include('1930')
      expect(result[4][:res][0][:frequencia]).to eq 6921
      expect(result[4][:res][8][:periodo]).to include('2000,2010')
      expect(result[4][:res][8][:frequencia]).to eq 768
    end
  end
end
