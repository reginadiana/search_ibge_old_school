# frozen_string_literal: true

require 'spec_helper'

describe Api do
  api = Api.new

  context 'should get history of' do
    it 'a single name' do
      json = File.read('spec/fixtures/frequence_names/single_name.json')
      url = api.url_frequence('diana')
      response = double('faraday_response', body: json, status: 200)
      allow(Faraday).to receive(:get).with(url).and_return(response)
      result = api.requisition(url)

      expect(result[0][:res].length).to eq 9
      expect(result[0][:nome]).to eq 'DIANA'

      expect(result[0][:res][0][:periodo]).to include('1930')
      expect(result[0][:res][0][:frequencia]).to eq 88

      expect(result[0][:res][8][:periodo]).to include('2000,2010')
      expect(result[0][:res][8][:frequencia]).to eq 864_3
    end

    it 'empty name and return empty array' do
      url = api.url_frequence('')
      response = double('faraday_response', body: '{}', status: 500)
      allow(Faraday).to receive(:get).with(url).and_return(response)

      result = api.requisition(url)
      expect(result.length).to eq 0
    end
  end
end
