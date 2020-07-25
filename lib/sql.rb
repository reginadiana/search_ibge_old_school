# frozen_string_literal: true

class Sql

  private

  def read_file(file)
    File.open(Dir.pwd + "/queries/#{file}").read
  end

end
