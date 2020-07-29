# frozen_string_literal: true

require 'spec_helper'

describe Api do
  api = Api.new

  context 'should get ranking of 20 names most used in Santo André (SP) to' do
    it 'both sexes' do
      json = File.read('spec/fixtures/ranking_names_by_county/both_sexes.json')
      url = api.url_most_used('3547809', 'both')
      response = double('faraday_response', body: json, status: 200)
      allow(Faraday).to receive(:get).with(url).and_return(response)
      result = api.requisition(url)

      expect(result[0][:res].length).to eq 20

      expect(result[0][:res][0][:nome]).to eq 'MARIA'
      expect(result[0][:res][0][:frequencia]).to eq 346_97
      expect(result[0][:res][0][:ranking]).to eq 1

      expect(result[0][:res][19][:nome]).to eq 'FRANCISCO'
      expect(result[0][:res][19][:frequencia]).to eq 317_1
      expect(result[0][:res][19][:ranking]).to eq 20
    end
    it 'female sex' do
      json = File.read('spec/fixtures/ranking_names_by_county/female.json')
      url = api.url_most_used('3547809', 'f')
      response = double('faraday_response', body: json, status: 200)
      allow(Faraday).to receive(:get).with(url).and_return(response)
      result = api.requisition(url)

      expect(result[0][:res].length).to eq 20
    
      expect(result[0][:res][0][:nome]).to eq 'MARIA'
      expect(result[0][:res][0][:frequencia]).to eq 346_08
      expect(result[0][:res][0][:ranking]).to eq 1

      expect(result[0][:res][19][:nome]).to eq 'RENATA'
      expect(result[0][:res][19][:frequencia]).to eq 190_4
      expect(result[0][:res][19][:ranking]).to eq 20
    end
    it 'male sex' do
      json = File.read('spec/fixtures/ranking_names_by_county/male.json')
      url = api.url_most_used('3547809', 'm')
      response = double('faraday_response', body: json, status: 200)
      allow(Faraday).to receive(:get).with(url).and_return(response)
      result = api.requisition(url)

      expect(result[0][:res].length).to eq 20
    
      expect(result[0][:res][0][:nome]).to eq 'JOSE'
      expect(result[0][:res][0][:frequencia]).to eq 169_06
      expect(result[0][:res][0][:ranking]).to eq 1

      expect(result[0][:res][19][:nome]).to eq 'ANDRE'
      expect(result[0][:res][19][:frequencia]).to eq 303_3
      expect(result[0][:res][19][:ranking]).to eq 20
    end
    it 'should return return empty array  if API error' do
      url = api.url_most_used('3547809', 'both')
      response = double('faraday_response', body: '{}', status: 500)
      allow(Faraday).to receive(:get).with(url).and_return(response)

      result = api.requisition(url)
      expect(result.length).to eq 0
    end
  end
end
