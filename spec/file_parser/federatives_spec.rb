# frozen_string_literal: true

require 'spec_helper'
require 'sqlite3'

describe FileParser do
  it 'Checks if file exist' do
    files = FileParser.new.check_file_exit('new_federatives')
    expect(files).to eq true
  end
  it 'Checks if exit 27 UFs' do
    ufs = FileParser.new.open_federative_file
    expect(ufs.length).to eq 27
  end
  it 'Checks if exit 4 columns ' do
    first_line = FileParser.new.open_federative_file[0]
    expect(first_line).to eq "UF,11,Rondônia,1777225\n"
  end
  it 'Checks if the sum of the population of each municipality corresponds to the total in Brazil' do
    total_population = FileParser.new.total_population_brazil
    expect(total_population).to be > 210_147_124
  end
end
