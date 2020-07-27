# frozen_string_literal: true

require 'spec_helper'
require 'sqlite3'

describe FileParser do
  it 'Checks if file exist' do
    files = FileParser.new.check_file_exit('new_counties')
    expect(files).to eq true
  end
  it 'Checks if exit 5_570 counties' do
    counties = FileParser.new.open_county_file
    expect(counties.length).to eq 5570
  end
  it 'Checks if exit 5 columns' do
    first_line = FileParser.new.open_county_file[0]
    expect(first_line).to eq "MU,1100015,Alta Floresta D'Oeste (RO),22945,RO\n"
  end
end
