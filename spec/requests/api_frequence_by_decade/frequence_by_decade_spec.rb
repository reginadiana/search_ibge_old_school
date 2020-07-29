# frozen_string_literal: true

require 'spec_helper'

describe Api do
  api = Api.new

  context 'should get names most used in 1950 to' do
    it 'both sexes' do
      json = File.read('spec/fixtures/ranking_by_decade/both_sexes.json')
      url = api.url_most_used_by_decade('1950', 'both')
      response = double('faraday_response', body: json, status: 200)
      allow(Faraday).to receive(:get).with(url).and_return(response)
      result = api.requisition(url)

      expect(result.length).to eq 1

      expect(result[0][:res][0][:nome]).to eq 'MARIA'
      expect(result[0][:res][0][:frequencia]).to eq 148_704_2
      expect(result[0][:res][0][:ranking]).to eq 1

      expect(result[0][:res][19][:nome]).to eq 'LUIS'
      expect(result[0][:res][19][:frequencia]).to eq 480_56
      expect(result[0][:res][19][:ranking]).to eq 20
    end
    it 'female sex' do
      json = File.read('spec/fixtures/ranking_by_decade/female.json')
      url = api.url_most_used_by_decade('1950', 'f')
      response = double('faraday_response', body: json, status: 200)
      allow(Faraday).to receive(:get).with(url).and_return(response)
      result = api.requisition(url)

      expect(result.length).to eq 1

      expect(result[0][:res][0][:nome]).to eq 'MARIA'
      expect(result[0][:res][0][:frequencia]).to eq 148_176_6
      expect(result[0][:res][0][:ranking]).to eq 1

      expect(result[0][:res][19][:nome]).to eq 'ELZA'
      expect(result[0][:res][19][:frequencia]).to eq 274_70
      expect(result[0][:res][19][:ranking]).to eq 20
    end
    it 'male sexes' do
      json = File.read('spec/fixtures/ranking_by_decade/male.json')
      url = api.url_most_used_by_decade('1950', 'm')
      response = double('faraday_response', body: json, status: 200)
      allow(Faraday).to receive(:get).with(url).and_return(response)
      result = api.requisition(url)

      expect(result.length).to eq 1

      expect(result[0][:res][0][:nome]).to eq 'JOSE'
      expect(result[0][:res][0][:frequencia]).to eq 647_405
      expect(result[0][:res][0][:ranking]).to eq 1

      expect(result[0][:res][19][:nome]).to eq 'MARIO'
      expect(result[0][:res][19][:frequencia]).to eq 289_77
      expect(result[0][:res][19][:ranking]).to eq 20
    end
    it 'should return return empty array if API error beacuse decade is invalid' do
      url = api.url_most_used_by_decade('1951', 'm')
      response = double('faraday_response', body: '{}', status: 500)
      allow(Faraday).to receive(:get).with(url).and_return(response)

      result = api.requisition(url)
      expect(result.length).to eq 0
    end
  end
end
