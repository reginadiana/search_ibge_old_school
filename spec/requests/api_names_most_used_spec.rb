# frozen_string_literal: true

require 'spec_helper'

describe Api do
  api = Api.new

  context 'should get ranking of 20 names most used in SP to' do
    it 'both sexes' do
      json = File.read('spec/fixtures/ranking_names_by_uf/both_sexes.json')
      url = api.url_most_used('35', 'both')
      response = double('faraday_response', body: json, status: 200)
      allow(Faraday).to receive(:get).with(url).and_return(response)
      result = api.requisition(url)

      expect(result[0][:res].length).to eq 20

      expect(result[0][:res][0][:nome]).to eq 'MARIA'
      expect(result[0][:res][0][:frequencia]).to eq 214_323_2
      expect(result[0][:res][0][:ranking]).to eq 1

      expect(result[0][:res][19][:nome]).to eq 'RODRIGO'
      expect(result[0][:res][19][:frequencia]).to eq 173_059
      expect(result[0][:res][19][:ranking]).to eq 20
    end
    it 'female sex' do
      json = File.read('spec/fixtures/ranking_names_by_uf/female.json')
      url = api.url_most_used('35', 'f')
      response = double('faraday_response', body: json, status: 200)
      allow(Faraday).to receive(:get).with(url).and_return(response)
      result = api.requisition(url)

      expect(result[0][:res].length).to eq 20
    
      expect(result[0][:res][0][:nome]).to eq 'MARIA'
      expect(result[0][:res][0][:frequencia]).to eq 213_605_7
      expect(result[0][:res][0][:ranking]).to eq 1

      expect(result[0][:res][19][:nome]).to eq 'VANESSA'
      expect(result[0][:res][19][:frequencia]).to eq 110_214
      expect(result[0][:res][19][:ranking]).to eq 20
    end
    it 'male sex' do
      json = File.read('spec/fixtures/ranking_names_by_uf/male.json')
      url = api.url_most_used('35', 'm')
      response = double('faraday_response', body: json, status: 200)
      allow(Faraday).to receive(:get).with(url).and_return(response)
      result = api.requisition(url)

      expect(result[0][:res].length).to eq 20
    
      expect(result[0][:res][0][:nome]).to eq 'JOSE'
      expect(result[0][:res][0][:frequencia]).to eq 111_506_0
      expect(result[0][:res][0][:ranking]).to eq 1

      expect(result[0][:res][19][:nome]).to eq 'GUSTAVO'
      expect(result[0][:res][19][:frequencia]).to eq 164_437
      expect(result[0][:res][19][:ranking]).to eq 20
    end
    it 'should return return empty array  if API error' do
      url = api.url_most_used('35', 'both')
      response = double('faraday_response', body: '{}', status: 500)
      allow(Faraday).to receive(:get).with(url).and_return(response)

      result = api.requisition(url)
      expect(result.length).to eq 0
    end
  end
end
